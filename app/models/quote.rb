class Quote < ApplicationRecord
    belongs_to :company

    validates :quote, presence: true
    ## This:- (after_create_commit -> { broadcast_prepend_later_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes"})
    # is considered valid code for updating all connecting to this channel
    
    ## this code is to broadcast changes only if the logged in user is from this company by attaching the company name to the channel name.
    # It only require this channel name "<%= turbo_stream_from current_company, "quotes" %>" company denotes the model name in the first array element.
    broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend

## This is Similar to the first code but it uses default variables which will result the above (you can also change the data as only the channel name)
    after_update_commit -> { broadcast_replace_later_to "quotes" }

    after_destroy_commit -> { broadcast_remove_to "quotes" }
    scope :ordered, -> { order(created_at: :desc) }
end

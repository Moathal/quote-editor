class Quote < ApplicationRecord
    belongs_to :company

    validates :quote, presence: true
    after_create_commit -> { broadcast_prepend_later_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes"}  
    
# Similar to the above code but it uses default variables which will result the above (you can also change the data as only the channel name)
    after_update_commit -> { broadcast_replace_later_to "quotes" }

    after_destroy_commit -> { broadcast_remove_to "quotes" }
    scope :ordered, -> { order(created_at: :desc) }
end

class Quote < ApplicationRecord
    validates :quote, presence: true

    scope :ordered, -> { order(created_at: :desc) }
end

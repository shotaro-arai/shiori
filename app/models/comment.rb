class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :text, presence: true, length: { minimum: 1, maximum: 140 }
end

class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image

  validates :text, :age, :sex, presence: true
end

class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :text, :age, :sex, presence: true
end

class Profile < ApplicationRecord
  belongs_to :user, optional: true
  valdates :text, presence: true
end

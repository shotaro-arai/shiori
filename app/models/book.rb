class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :likes
  has_many :users, through: :likes

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  validates :genre_id, presence: true, numericality:{other_than: 0}

  with_options presence: true do
    validates :text, length: { minimum: 1, maximum: 140 }
    validates :quote, length: { minimum: 1, maximum: 140 }
    validates :title
    validates :author
    validates :publish
    validates :year, numericality: { only_integer: true, less_than_or_equal_to: 2021 }
    validates :page, numericality: { only_integer: true }
  end
end

class Book < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    balidates :text,length: { minimum: 1, maximum: 140 }
    balidates :quote,length: { minimum: 1, maximum: 140 }
    balidates :title
    balidates :author
    balidates :publish
    balidates :yeare, numericality: {only_integer: true} 
    balidates :page, numericality: {only_integer: true} 
  end
end

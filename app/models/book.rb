class Book < ApplicationRecord
  has_many :favorites
  has_many :book_lists, through: :favorites
end

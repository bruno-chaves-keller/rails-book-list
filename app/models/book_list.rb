class BookList < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :books, through: :favorites
end

class Favorite < ApplicationRecord
  belongs_to :book_list
  belongs_to :book
end

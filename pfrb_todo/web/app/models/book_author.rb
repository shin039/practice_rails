class BookAuthor < ApplicationRecord

  # Relation
  belongs_to :book
  belongs_to :author
end

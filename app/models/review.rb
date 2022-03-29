class Review < ApplicationRecord
  belongs_to :rental

  validates :description, length: { minimum: 4 }
end

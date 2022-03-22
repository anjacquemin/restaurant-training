class Rental < ApplicationRecord
  has_many :reviews

  belongs_to :user
  belongs_to :restaurant
end

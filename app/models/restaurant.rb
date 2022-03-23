class Restaurant < ApplicationRecord
  has_many :rentals, dependent: :destroy
  has_many :reviews, through: :rentals, dependent: :destroy
  belongs_to :user
  has_many_attached :photos
end

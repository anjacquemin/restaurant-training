class Restaurant < ApplicationRecord
  has_many :rentals, dependent: :destroy
  has_many :reviews, through: :rentals, dependent: :destroy
  belongs_to :user
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true }
    }


end

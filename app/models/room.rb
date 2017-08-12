class Room < ApplicationRecord
  belongs_to :user
  has_many :roomphotos
  has_many :reservations
  has_many :guest_reviews

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type,  presence: true
  validates :room_type,  presence: true
  validates :accommodate, presence: true
  validates :bed_room ,  presence: true
  validates :bath_room,  presence: true

  def use_first_photo(size = nil)
    if self.roomphotos.length > 0
      pic = self.roomphotos[0].image.url(size)
    else
      pic = "photo_blank.png"
    end
    pic
  end

  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
  end

end

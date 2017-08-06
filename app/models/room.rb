class Room < ApplicationRecord
  belongs_to :user
  has_many :roomphotos

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
end

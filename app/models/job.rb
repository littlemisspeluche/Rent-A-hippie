class Job < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, presence: true
  validates :location, presence: true
  validates :cost, presence: true
  validates :time, presence: true
end



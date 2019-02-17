class Job < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, presence: true
  validates :location, presence: true
  validates :cost, presence: true
  validates :time, presence: true
end



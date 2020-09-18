class City < ApplicationRecord
  has_many :pincodes
  has_many :regions
  has_many :areas
  belongs_to :country
  belongs_to :state

  validates :name,
    presence: true,
    uniqueness: true,
    length: { minimum: 3, maximum: 30 }
end

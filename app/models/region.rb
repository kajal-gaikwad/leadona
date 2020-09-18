class Region < ApplicationRecord
  belongs_to :country
  belongs_to :state, optional: true
  belongs_to :city
  has_many :areas

  validates :name,
    presence: true,
    uniqueness: true
end

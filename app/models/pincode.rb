class Pincode < ApplicationRecord
  belongs_to :country
  belongs_to :state
  belongs_to :city
  has_many :areas
end

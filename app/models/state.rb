class State < ApplicationRecord
  has_many :states
  has_many :pincodes
  has_many :regions
  has_many :areas
  belongs_to :country
end

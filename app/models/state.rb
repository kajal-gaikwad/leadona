class State < ApplicationRecord
  CODE_REGEX = /[A-Z]/

  has_many :states
  has_many :pincodes
  has_many :regions
  has_many :areas
  belongs_to :country

  validates :name,
    presence: true,
    uniqueness: true,
    length: { minimum: 3, maximum: 30 }

  validates :code,
    presence: true,
    length: { minimum: 2 },
    format: CODE_REGEX
end

class Pincode < ApplicationRecord
  CODE_REGEX = /[A-Z0-9]{4}/

  belongs_to :country
  belongs_to :state
  belongs_to :city
  has_many :areas

  validates :code,
    presence: true,
    length: { minimum: 4, maximum: 12 },
    format: CODE_REGEX
end

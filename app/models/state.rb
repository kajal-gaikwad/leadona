class State < ApplicationRecord
  CODE_REGEX = /[A-Z]/

  has_many :states
  has_many :pincodes
  has_many :regions
  has_many :areas
  belongs_to :country

  validates :name,
    allow_blank: true,
    uniqueness: true,
    length: { minimum: 3, maximum: 30 }

  validates :code,
    allow_blank: true,
    length: { minimum: 2 },
    format: CODE_REGEX

  before_save :uppercase_code

  def uppercase_code
    code.upcase!
  end
end

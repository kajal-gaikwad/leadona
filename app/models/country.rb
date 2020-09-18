class Country < ApplicationRecord
  NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/

  has_many :states
  has_many :cities
  has_many :regions
  has_many :pincodes
  has_many :areas
  has_and_belongs_to_many :country_groups

  validates :name,
            presence: true,
            uniqueness: true,
            length: { minimum: 3, maximum: 30 },
            format: NAME_REGEX

  validates :code,
            presence: true,
            length: { minimum: 2, maximum: 3 }

  before_save :lowercase_code, :lowercase_name

  def lowercase_code
    code.downcase!
  end

  def lowercase_name
    name.downcase!
  end
end

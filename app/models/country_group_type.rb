class CountryGroupType < ApplicationRecord
  has_many :country_groups

  validates :name, presence: true, uniqueness: true
end

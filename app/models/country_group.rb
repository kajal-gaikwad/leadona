class CountryGroup < ApplicationRecord
  belongs_to :country_group_type
  has_and_belongs_to_many :countries
end

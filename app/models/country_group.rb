class CountryGroup < ApplicationRecord
  belongs_to :country_group_type
  has_and_belongs_to_many :countries
  accepts_nested_attributes_for :country_group_type
  
  validates :name, presence: true, uniqueness: true
end

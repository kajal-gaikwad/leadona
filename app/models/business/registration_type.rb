class Business::RegistrationType < ApplicationRecord
  has_many :entities
  
  validates :name, uniqueness: true
end

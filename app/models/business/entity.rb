class Business::Entity < ApplicationRecord
  belongs_to :registration_type

  validates :name, uniqueness: true
  validates :registration_type_id, uniqueness: true
end

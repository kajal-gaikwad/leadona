class Business::Entity < ApplicationRecord
  belongs_to :registration_type
  has_many :infos

  validates :name, uniqueness: true
  validates :registration_type_id, uniqueness: true
end

class Business::Entity < ApplicationRecord
  belongs_to :registration_type
  has_many :infos
  has_many :branches
  has_many :galleries, as: :galleryable

  validates :name, uniqueness: true
  validates :registration_type_id, uniqueness: true
end

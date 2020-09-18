class Business::Entity < ApplicationRecord
  belongs_to :registration_type
  has_one :infos
  has_many :branches
  has_many :galleries, as: :galleryable
  has_many :working_hours, as: :workable

  validates :name, uniqueness: true
  validates :registration_type_id, uniqueness: true
  validates :description, presence: true
end

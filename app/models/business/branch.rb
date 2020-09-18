class Business::Branch < ApplicationRecord
  belongs_to :entity
  has_many :galleries, as: :galleryable
  has_many :working_hours, as: :workable
end

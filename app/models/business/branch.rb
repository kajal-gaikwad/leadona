class Business::Branch < ApplicationRecord
  belongs_to :entity
  has_many :galleries, as: :galleryable
end

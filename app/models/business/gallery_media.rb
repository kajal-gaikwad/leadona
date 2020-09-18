class Business::GalleryMedia < ApplicationRecord
  belongs_to :gallery
  has_one_attached :image
end

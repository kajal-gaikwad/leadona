class Business::Gallery < ApplicationRecord
  belongs_to :galleryable, polymorphic: true
  has_many :gallery_media
end

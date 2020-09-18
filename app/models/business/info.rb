class Business::Info < ApplicationRecord
  belongs_to :entity
  has_one_attached :logo
end

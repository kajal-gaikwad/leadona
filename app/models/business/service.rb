class Business::Service < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end

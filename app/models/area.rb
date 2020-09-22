class Area < ApplicationRecord
  belongs_to :country
  belongs_to :state, optional: true
  belongs_to :city
  belongs_to :region
  belongs_to :pincode

  validates :name,
    presence: true,
    uniqueness: true
end

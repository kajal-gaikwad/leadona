class Area < ApplicationRecord
  belongs_to :country
  belongs_to :state
  belongs_to :city
  belongs_to :region
  belongs_to :pincode
end

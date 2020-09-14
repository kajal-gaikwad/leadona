class Business::ProofType < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end

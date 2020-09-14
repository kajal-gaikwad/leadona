class Business::RegistrationType < ApplicationRecord
	validates :name, uniqueness: true
end

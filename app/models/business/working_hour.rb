class Business::WorkingHour < ApplicationRecord
  belongs_to :workable, polymorphic: true
end

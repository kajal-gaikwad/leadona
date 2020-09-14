class Business::SubCategory < ApplicationRecord
  PATH_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/

  has_and_belongs_to_many :categories

  validates :name, presence: true, uniqueness: true, format: PATH_REGEX
end

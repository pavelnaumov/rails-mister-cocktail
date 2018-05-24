class Cocktail < ApplicationRecord
  has_many :doses
  has_many :ingredients

  validates :name, uniqueness: true, presence: true
end

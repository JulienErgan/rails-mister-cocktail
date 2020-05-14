class Dose < ApplicationRecord
  # associations
  belongs_to :cocktail
  belongs_to :ingredient
  # validations
  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }
end

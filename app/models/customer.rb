class Customer < ApplicationRecord
  # validations: required fields
  validates :description, :phone, presence: true
  # validations: field size
  validates :description, length: { minimum: 2, maximum: 100 }
  validates :fantasy_name, length: { minimum: 1, maximum: 50 }
  validates :document, :number, length: { maximum: 25 }
  validates :state, length: { maximum: 2 }
  validates :city, :district, :complement, length: { maximum: 60 }
end

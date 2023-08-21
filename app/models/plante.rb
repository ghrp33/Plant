class Plante < ApplicationRecord
  validates :name, :price, presence: true
end

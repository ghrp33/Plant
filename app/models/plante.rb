class Plante < ApplicationRecord
  belongs_to :user
  validates :name, :price, presence: true
  has_one_attached :image
end

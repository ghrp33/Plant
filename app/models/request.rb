class Request < ApplicationRecord
  belongs_to :plante
  belongs_to :user

  validates :plante, uniqueness: { scope: :user }, on: :create
end

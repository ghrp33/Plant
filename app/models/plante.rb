class Plante < ApplicationRecord
  belongs_to :user
  validates :name, :price, presence: true
  has_one_attached :image

  # include PgSearch::Model
  # pg_search_scope :search_by_name_and_variety_and_description,
  #                 against: %i[name variety description],
  #                 using: {
  #                   tsearch: { prefix: true }
  #                 }
end

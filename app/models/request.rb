class Request < ApplicationRecord
  enum status: { pending: 0, approven: 1, rejected: 2 }
  belongs_to :plante
  belongs_to :user
end

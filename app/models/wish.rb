class Wish < ApplicationRecord
  belongs_to :user
  belongs_to :whisky

  validates :whisky_id, uniqueness: {scope: :user_id}
end

class Note < ApplicationRecord
  belongs_to :user
  belongs_to :whisky

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

end

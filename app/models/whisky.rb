class Whisky < ApplicationRecord
  belongs_to :user
  has_many :notes

  has_many :wishes, dependent: :destroy
  has_many :users, through: :wishes
end

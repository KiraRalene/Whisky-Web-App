class Whisky < ApplicationRecord
  belongs_to :user
  has_many :notes

  has_many :wishes, dependent: :destroy
  has_many :users, through: :wishes

  def self.search(search)
    if search
      where("name ILIKE ?", "%#{search}%")
    else
      all
    end
  end
end

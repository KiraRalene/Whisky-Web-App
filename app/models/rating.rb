class Rating < ApplicationRecord
  belongs_to :note
  belongs_to :whisky

  def average_rating
    ratings.sum(:score) / ratings.size
  end
end

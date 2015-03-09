class Review < ActiveRecord::Base
  belongs_to :movie
  STARS = [1, 2, 3, 4, 5]
  validates :star_rating, inclusion: {in: STARS, message: "is Invalid"}
  validates :comment, :presence => true

end

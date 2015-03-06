class Movie < ActiveRecord::Base
  has_many :reviews
  MPAA = %w{G PG PG-13 R NC-17}
  validates :mpaa_rating, inclusion: {in: MPAA, message: "is Invalid"}
end

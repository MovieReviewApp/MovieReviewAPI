class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :star_rating, :username, :movie_id
end

class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :star_rating, :movie_id
end

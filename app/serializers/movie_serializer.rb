class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :gross, :release_date,:mpaa_rating, :description
end

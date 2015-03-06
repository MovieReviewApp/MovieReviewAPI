class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    render json: @movies, status: 200
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :gross, :release_date,:mpaa_rating, :description)
  end

end

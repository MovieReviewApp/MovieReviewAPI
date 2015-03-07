class MoviesController < ApplicationController

  def show
    @movie = Tmdb::Movie.find(params[:id])
    @my_movie = Tmdb::Movie.detail(@movie.first.id)
    render json: {movie: @my_movie}
  end

  def show_year
    @year = Tmdb::Movie.discover(year: params[:id])
    render json: {movie: @year}
  end

end

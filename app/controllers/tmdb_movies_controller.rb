class MoviesController < ApplicationController
  Tmdb::Api.key("1e0daf4f29d2c8fbf963f34dedf3a454")

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

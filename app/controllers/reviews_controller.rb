class ReviewsController < ApplicationController

def index
  @movie = Movie.find(params[:movie_id])
  @reviews = @movie.reviews

  render json: @reviews, status: :ok
end

def create
  # @movie = Movie.find(params[:movie_id])
  @review = Review.new(review_params)
  # @movie.reviews << @review
  if @review.save
    render json: @review, status: :created, location: @review
  else
    render json: @review.errors, status: :unprocessable_entity
  end
end

# def update
#   @review = Review.find(params[:id])
#   if @review.update(review_params)
#     render json: @review, status: :ok
#   else
#     render json: @review.errors, status: :unprocessable_entity
#   end
# end

def update
  @review = Review.find(params[:id])
  if params[:movie_id]
    @movie = Movie.find(params[:movie_id])
    unless @movie.reviews.include? @review
      @movie.reviews << @review
    end
    render json: @movie.reviews, status: :ok
  else
    if @review.update(review_params)
      head :no_content
    else
      render json: @review.errors,status: :unprocessable_entity
    end
  end
end

def destroy
  @review = Review.find(params[:id])
  @review.destroy
  head :no_content
end

private
def review_params
  params.require(:review).permit(:comment, :star_rating, :username, :movie_id)
end

end

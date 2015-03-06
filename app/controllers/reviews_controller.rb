class ReviewsController < ApplicationController

def create
end

def update
end

def destroy
end

private
def review_params
  params.require(:review).permit(:comments, :star_rating, :username,:movie_id)
end

end

require 'rails_helper'

describe 'Reviews Requests' do
  before(:all) do
    Movie.destroy_all
    Review.destroy_all
    @movies = FactoryGirl.create_list(:movie, 25)
    @reviews = FactoryGirl.create_list(:review, 13)
  end

  describe '#index' do
    it 'gets all reviews for a movies' do
      get "/movies/#{@movies.first.id}/reviews"
      expect(response).to be_success
    end
  end

describe '#create' do
    it 'should create a review on that post and return the review' do
      post "/movies/#{@movies.first.id}/reviews",
      { review: {
          comment: "Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui.",
          username: "JSONWharff",
          star_rating: 3
        } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON
    end
  end

  describe '#update' do
    it 'should update the review and return the review in json' do
      put "/admin/reviews/#{@reviews.first.id}",
      { review: {
          comment: "Something else"
        }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON
    end
  end

  describe '#destroy' do
    it 'kills the review found by id' do
      review = @reviews.first
      delete "/admin/reviews/#{review.id}"
      expect(response.status). to eq 204

    end
  end

end

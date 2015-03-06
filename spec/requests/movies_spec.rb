require 'rails_helper'

describe 'Movie Requests' do
  before(:all) do
    Movie.destroy_all
    @movies = FactoryGirl.create_list(:movie, 25)
  end

  describe '#index' do
    it 'gets all of the movies' do
      get '/movies'
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 25
    end
  end

  describe '#create' do
    it 'should create a new movie and return it' do
      post '/admin/movies',
      { movie: {
          title: "Ultricies Vulputate Risus",
          description: "Aenean lacinia bibendum nulla sed consectetur. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.",
            release_date: 2015-03-12,
            gross: 5000000,
            mpaa_rating: 'PG'
        } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

      movie = JSON.parse(response.body)
      expect(movie['title']).to eq "Ultricies Vulputate Risus"
    end
  end

   describe '#show' do
    it 'should retrieve a single movie by id and return json' do
      @movie = @movies.first
      get "/movies/#{@movie.id}"
      expect(response).to be_success

      movie = JSON.parse(response.body)
      expect(movie['title']).to eq @movie.title
    end
  end

  describe '#update' do
    before(:all) do
      @movie = @movies.first
    end
    it 'should update the parameters of the movie and return that movie' do
      put "/admin/movies/#{@movie.id}",
      { movie: {
          title: "Something else",
          description: "A new body"
        }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON

      movie = JSON.parse(response.body)
      expect(movie['title']).to eq "Something else"
    end
  end

  describe '#destroy' do
    it 'should kill the movie' do
      movie = @movies.first
      delete "/admin/movies/#{movie.id}"
      expect(response.status).to eq 204
    end
  end

end

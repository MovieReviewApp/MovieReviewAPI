Rails.application.routes.draw do
  resources :movies, only: [:show] do
    resources :reviews, only: [:create, :index]
  end

  get 'movies/show_year/:id', to: 'movies#show_year'


  resources :movies, only: [:index]

  scope '/admin' do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    resources :movies, only: [:create, :update, :destroy]
    resources :reviews, only: [:update, :destroy]
  end

end

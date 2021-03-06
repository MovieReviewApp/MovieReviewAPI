Rails.application.routes.draw do

  resources :reviews, only: [:create]
  resources :movies, only: [:index]

  resources :users, defaults: { format: :json }, only: [:show, :index, :create] do
    post 'sign_in', on: :collection
  end

  resources :movies, only: [:show] do
    resources :reviews, only: [:update]
  end

  scope '/admin' do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    resources :movies, only: [:create, :update, :destroy]
    resources :reviews, only: [:update, :destroy]
  end

end

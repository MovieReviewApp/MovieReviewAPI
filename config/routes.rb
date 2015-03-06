Rails.application.routes.draw do
  resources :movies, only: [:show] do
    resources :reviews, only: [:create]
  end

  namespace :admin do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    resources :movies, only: [:create, :update, :destroy]
    resources :reviews, only: [:update, :destroy]
  end

end

Rails.application.routes.draw do

  resources :reviews, only: [:create]
  resources :movies, only: [:index, :show]

  scope '/admin' do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    resources :movies, only: [:create, :update, :destroy]
    resources :reviews, only: [:update, :destroy]
  end

end

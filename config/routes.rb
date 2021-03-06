Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :products
  end
  root "products#index"
  resources :products do
    member do
      post :add_to_cart

    end

  end
  resources :carts do
    collection do
      delete :all_delete
      post :checkout
    end
  end
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

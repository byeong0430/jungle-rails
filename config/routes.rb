# frozen_string_literal: true

Rails.application.routes.draw do
  # INITIAL ROOT
  # Resources: products, categories, cart and orders
  root to: 'products#index'
  # INITIAL ROOT - END

  resources :products, only: %i[index show] do
    resources :reviews, only: [:create]
  end

  resources :categories, only: [:show]

  # `put` HTTP verb is available by add_item(). `delete` is available by remove_item()
  # these functions are available for cart (nesting)
  # resources should never be nested more than 1 level deep.
  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
  end

  resources :orders, only: %i[create show]

  # ADMIN
  # There are multiple controllers for products and categories.
  # In order to avoid name clash, use namespace!
  namespace :admin do
    # root directory of /admin & action = show
    root to: 'dashboard#show'
    # resources are objects that admin has access to.
    # for example. 'products' resource is represented by 'Product' Model, which can be found in 'products' table
    resources :products, except: %i[edit update show]
    resources :categories, only: %i[index new create]
  end
  # ADMIN - END

  # LOGIN
  resources :sessions, only: %i[new create destroy]
  # LOGIN - END

  # SIGNUP
  resources :users, only: %i[new create]
  # SIGNUP - END

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

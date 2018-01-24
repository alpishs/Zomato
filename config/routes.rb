Rails.application.routes.draw do
  resources :restaurants do
  	get :store_data_rest, on: :collection
  end
  resources :cuisines do
  	get :store_data, on: :collection
  end
  root :to => 'cuisines#index'
end

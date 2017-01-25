Rails.application.routes.draw do
  root to: 'gallaries#index'

  resources :gallaries do
  	put :sort, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

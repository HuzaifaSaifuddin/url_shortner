Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'urls#index'

  get '/(:short_url_path)', to: "urls#show"

  resources :urls, only: [:create, :show, :destroy]
end

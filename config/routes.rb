Rails.application.routes.draw do
  root 'welcome#index'
  get 'shoes/:shoe_type' => 'shoes#index', as: 'shoes'

  resources :closets
  resources :shoes, except: :index

end

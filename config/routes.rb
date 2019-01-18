Rails.application.routes.draw do
  resources :people do
    collection do
      get '/create_random_person', to: 'people#create_random_person'
      get '/delete_all', to: 'people#delete_all'
    end
  end
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"

  get 'pages/home'
  resources :users
  get 'welcome', to: 'welcome#index'
  get 'welcome/sq', to: 'welcome#sq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

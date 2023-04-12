Rails.application.routes.draw do
  resources :fighter_photos
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'pages#main'
    devise_for :users

    resources :articles do
      resources :photos, only: [:create, :destroy]
    end

    resources :fights do
      resources :fighters, only: [:index, :create, :destroy]
      resources :events, only: [:index, :create, :destroy]
    end

    resources :events do
      get :fight_fields, on: :collection
      resources :event_photos, only: [:create, :destroy]
    end

    resources :fighters do
      resources :fighter_photos, only: [:create, :destroy]
    end

    
    get '/videos', to: 'pages#videos'
    get '/merch', to: 'pages#merch'
    get '/about', to: 'pages#about'
    get '/blog', to: 'pages#blog'
    get '/terms', to: 'pages#terms'
    get '/politics', to: 'pages#politics'
  end
end

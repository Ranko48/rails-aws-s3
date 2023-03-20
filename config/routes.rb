Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'pages#main'

    get '/about', to: 'pages#about'
    get '/blog', to: 'pages#blog'
    get '/terms', to: 'pages#terms'
    get '/politics', to: 'pages#politics'
  end
end

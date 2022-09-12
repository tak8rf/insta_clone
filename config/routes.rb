Rails.application.routes.draw do
  resources :feeds
  resources :contacts
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
  resources :users do
    get :favorites, on: :collection 
  end
  root to: "feeds#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

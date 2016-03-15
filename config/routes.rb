Rails.application.routes.draw do


  resources :labels, only: [:show]
  resources :questions
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
  resources :users, only: [:new, :create, :show]
  post 'users/confirm' => 'users#confirm'

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :sessions, only: [:new, :create, :destroy]
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :topics, only: [:index, :show]
      resources :posts, only: [:index, :show]
      resources :comments, only: [:index, :show]
    end
  end
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

end

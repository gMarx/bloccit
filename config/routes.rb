Rails.application.routes.draw do

  resources :questions
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'

  resources :sessions, only: [:new, :create, :destroy]
  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

end

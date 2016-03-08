Rails.application.routes.draw do

  get 'labels/show'

  resources :questions
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]
  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

end

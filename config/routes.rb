Rails.application.routes.draw do

  get 'users/new'

  get 'users/create'

  resources :questions
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
  resources :users, only: [:new, :create]

  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

end

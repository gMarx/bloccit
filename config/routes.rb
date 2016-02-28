Rails.application.routes.draw do

  resources :questions
  resources :advertisements
  resources :posts

  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

  end

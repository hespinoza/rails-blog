Rails.application.routes.draw do
  resources :categories
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :articles

  get 'my-articles' => 'articles#my_articles', :as => :my_articles

  get 'news' => 'articles#news', :as => :news
  get 'reviews' => 'articles#reviews', :as => :reviews
  get 'unboxing' => 'articles#unboxing', :as => :unboxing
  get 'gameplays' => 'articles#gameplays', :as => :gameplays
  get 'article/:id/publish' => 'articles#publish', :as => :publish_article
  get 'article/:id/unpublish' => 'articles#unpublish', :as => :unpublish_article
  get 'article/:id/revise' => 'articles#revise', :as => :revise_article
  get 'profile' => 'users#profile', :as => :my_profile
  get 'to-revise' => 'articles#to_revise', :as => :to_revise
  root 'articles#index'

  
end

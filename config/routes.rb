Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :articles

  get 'my-articles' => 'articles#my_articles', :as => :my_articles

  get 'news' => 'articles#news', :as => :news
  get 'reviews' => 'articles#reviews', :as => :reviews
  get 'unboxing' => 'articles#unboxing', :as => :unboxing
  get 'gameplays' => 'articles#gameplays', :as => :gameplays
  root 'articles#index'

  
end

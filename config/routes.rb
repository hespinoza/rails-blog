Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :articles

  get 'my-articles' => 'articles#my_articles', :as => :my_articles

  root 'articles#index'

  
end

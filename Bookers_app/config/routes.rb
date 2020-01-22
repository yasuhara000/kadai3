Rails.application.routes.draw do

  devise_for :users
  #root "book#new"
  get '/' => 'home#top' ,as: 'root'
  get 'home/about' => 'home#about' ,as: 'home_about'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:show, :edit,:update,:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

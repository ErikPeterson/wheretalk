Rails.application.routes.draw do
  devise_for :users
  root :to=> "pages#index"
  get "profile", :to => "pages#profile"
  get "profile/:id", :to => "pages#profile"
end

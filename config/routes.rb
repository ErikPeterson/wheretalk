Rails.application.routes.draw do
  devise_for :users
  get "/", :to=> "pages#index"
  get "profile", :to => "pages#profile"
  get "profile/:id", :to => "pages#profile"
end

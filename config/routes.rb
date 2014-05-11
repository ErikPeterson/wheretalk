Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  get "/", :to=> "pages#index"
  get "profile", :to => "pages#profile"
  get "profile/:id", :to => "pages#profile"
  post "geocode", :to => "geo_coding#geocode"
  post "geocode/near", :to => "geo_coding#get_nearby"
end

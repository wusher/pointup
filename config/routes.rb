Pointup::Application.routes.draw do

  get "/credentials" => "credentials#edit",   :as => :credentials
  put "/credentials" => "credentials#update", :as => :credentials
  
  get "/settings" => "settings#edit", :as => :settings
  put "/settings" => "settings#update", :as => :settings

  resources :users do 
    member do 
      get 'waiting', :as => :waiting
    end 
  end 

  #github authorization routes 
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout 
  match "/signin"  => "sessions#new", :as => :signin

  #root 
  root :to => 'home#index'
end 

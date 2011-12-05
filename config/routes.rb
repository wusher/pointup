Pointup::Application.routes.draw do

  resources :projects, :only => [ :index, :show] do 
    resources :lists,  :only => [ :index, :show ] do 
      resources :todos, :only => [:index, :show, :edit, :update ] 
    end 
  end 

  get  "/basecamp/sync" => "basecamp#sync"
  post "/basecamp/sync" => "basecamp#update"

  get "/credentials" => "credentials#edit",   :as => :credentials
  put "/credentials" => "credentials#update", :as => :credentials
  
  get "/settings" => "settings#edit", :as => :settings
  put "/settings" => "settings#update", :as => :settings


  resources :users, :only => [:index, :destroy] do 
    member do 
      put 'authorize'
    end 
  end 
  get 'waiting' => 'users#waiting', :as => :waiting

  #github authorization routes 
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout 
  match "/signin"  => "sessions#new", :as => :signin

  match "home/index" => "home#index"
  #root 
  #root :to => 'home#index'
  root :to => 'projects#index'
end 

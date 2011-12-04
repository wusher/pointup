Pointup::Application.routes.draw do


  #github authorization routes 
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout 
  match "/signin"  => "sessions#new", :as => :signin

  #root 
  root :to => 'home#index'
end 

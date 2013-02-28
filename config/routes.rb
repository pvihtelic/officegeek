Officegeek::Application.routes.draw do
  resources :topics

  resources :tutorials

  resources :packages

  get "/index" => "home#index", :as=>"index"
  get "/faq" => "home#faq", :as=>"faq"
  get "/privacy_policy" => "home#privacy_policy", :as=>"privacy_policy"
  get "/terms_and_conditions" => "home#terms_and_conditions", :as=>"terms_and_conditions"

  authenticated :user do
    root :to => 'home#index'
  end
  
  devise_scope :user do
    root :to => "home#index"
  end
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  
  resources :users do
    get 'invite', :on => :member
  end

end
Officegeek::Application.routes.draw do
  resources :topics

  resources :tutorials

  resources :packages

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
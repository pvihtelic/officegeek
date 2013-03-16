Officegeek::Application.routes.draw do
  
  resources :quizzes

  resources :topics

  resources :tutorials

  resources :packages


  get "/index" => "home#index", :as=>"index"
  get "/faq" => "home#faq", :as=>"faq"
  get "/privacy_policy" => "home#privacy_policy", :as=>"privacy_policy"
  get "/terms_and_conditions" => "home#terms_and_conditions", :as=>"terms_and_conditions"
  get "/chicago_classes" => "home#chicago_classes", :as=>"chicago_classes"

  put "/quizzes" => "quizzes#index", :as=>"quizzes_url"
  put "/quizzes/:id" => "quizzes#update"
  post "/quizzes/:id" => "quizzes#update"

  authenticated :user do
    root :to => 'home#index'
  end
  
  devise_scope :user do
    root :to => "home#index"
  end
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  
  resources :users do
    get 'invite', :on => :member
    resources :quizzes
  end

end
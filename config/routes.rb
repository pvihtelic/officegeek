Officegeek::Application.routes.draw do
  
  require 'gollum/frontend/app'

  

  Precious::App.set(:gollum_path, Rails.root.join('wiki').to_s)
  Precious::App.set(:default_markup, :markdown) # set your favorite markup language
  Precious::App.set(:wiki_options, {:universal_toc => false})
  mount Precious::App, at: 'wiki'



  resources :quizzes, :except => [:index, :new, :edit, :destroy] do
    collection do
      delete 'destroy_multiple'
    end
  end

  resources :topics, :except => [:new, :edit, :destroy]

  resources :tutorials, :except => [:index, :new, :edit, :destroy]

  resources :packages, :except => [:index, :new, :edit, :destroy]


  get "/index" => "home#index", :as=>"index"
  get "/faq" => "home#faq", :as=>"faq"
  get "/about" => "home#about", :as=>"about"
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
  
  resources :users, :except => [:index, :destroy] do
    get 'invite', :on => :member
    resources :quizzes, :except => [:index, :new, :edit, :destroy]
  end

end
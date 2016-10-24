Rails.application.routes.draw do
  resources "courses"
  namespace :admin do
    get '/dashboard/teachers' => 'dashboard#teachers'
    get '/dashboard/students' => 'dashboard#students'
    resources :users
  end
  get '/dashboard' => 'dashboard#index'
  get"/login" => "sessions#new",as: :login
  post"/sign" => "sessions#create"
  get"/logout" => "sessions#logout"
  get"/classrooms/registered" => "classrooms#registered"

  resources :home

  namespace :teacher do
    resources :courses do
      resources :classrooms do
        resources :users do
         member do
          post :pay
          end
         end
       end
    end
  end

  resources "users"
  resources :classrooms do
    member do
      post :register
    end
  end





end

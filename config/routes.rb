Rails.application.routes.draw do
  resources "courses"
  namespace :courses do
    post :search
    get :result
  end

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
  resources "notication" do
    member do
      get :delete
    end
  end

  resources :home

  namespace :teacher do
    resources :courses do
      resources :classrooms do
        resources :users do
         member do
          post :pay
          get :remove
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
  resources :users do
    member do
      post :changepassword
    end
    end



end

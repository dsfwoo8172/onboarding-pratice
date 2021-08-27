Rails.application.routes.draw do
  resources :users do
    collection do
      get :count, to: "users#count" # get total number of users
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

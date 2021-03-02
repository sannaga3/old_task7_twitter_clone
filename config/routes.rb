Rails.application.routes.draw do
  resources :posts do
    collection do
      post :confirm
      patch :confirm
    end
    member do
      patch :confirm
    end
  end
end

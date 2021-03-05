Rails.application.routes.draw do
  root "posts#published"

  resources :posts do
    collection do
      get :published
    end

    member do
      patch :publish
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

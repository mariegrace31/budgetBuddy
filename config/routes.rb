Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'categories#home', as: :authenticated_root
  end

  unauthenticated do
    root 'categories#index', as: :unauthenticated_root
  end

  resources :categories, only: %i[index new create destroy] do
    resources :exchanges, only: %i[index new create]
  end
end

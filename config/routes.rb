Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'categories#home', as: :authenticated_root
  end

  unauthenticated do
    root 'categories#index', as: :unauthenticated_root
  end

   devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :categories, only: %i[index home new create destroy] do
    get :home, on: :collection
    resources :exchanges, only: %i[index new create]
  end
end

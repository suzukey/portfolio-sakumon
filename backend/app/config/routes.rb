Rails.application.routes.draw do
  namespace :v1, format: 'json' do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'v1/auth/registrations'
    }

    resources :users, param: :name, only: [:show] do
      collection do
        get 'posts'
      end
    end

    resources :posts, except: [:index] do
      resources :questions

      collection do
        get 'search'
        get 'latest'
        get 'trend'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

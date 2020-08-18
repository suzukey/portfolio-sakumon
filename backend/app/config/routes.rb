Rails.application.routes.draw do
  scope :api do
    namespace :v1, format: 'json' do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'v1/auth/registrations'
      }

      scope :me do
        get 'posts', to: 'me#posts'
        get 'profile', to: 'me#profile'
      end

      resources :users, param: :name, only: [:show] do
        member do
          get 'posts'
        end
      end

      resources :posts, except: [:index] do
        resources :questions do
          resources :choices
        end

        resources :play, only: [] do
          collection do
            get 'start'
            get 'check'
          end
        end

        member do
          post 'images'
        end

        collection do
          get 'search'
          get 'latest'
          get 'trend'
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

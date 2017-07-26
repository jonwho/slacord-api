Rails.application.routes.draw do
  # this is cool because now you can reuse base routes
  # also makes it easier to migrate to a new api version
  # while keeping backwards compatibility on all or some routes
  concern :api_base do
    devise_scope :user do
      resources :registrations, only: [:create, :update, :destroy], defaults: { format: :json }
      resources :sessions, only: [:create, :update, :destroy], defaults: { format: :json }
      resource :password, only: [:create, :update]
    end
  end

  namespace :api do
    namespace :v1 do
      concerns :api_base
    end
  end
end

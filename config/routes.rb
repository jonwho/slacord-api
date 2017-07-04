Rails.application.routes.draw do
  devise_for :users

  # this is cool because now you can reuse base routes
  # also makes it easier to migrate to a new api version
  # while keeping backwards compatibility on all or some routes
  concern :api_base do
    resources :users, only: [:show]
  end

  namespace :api do
    namespace :v1 do
      concerns :api_base
    end
  end
end

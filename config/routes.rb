Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :places, only: [:index, :show, :new, :create, :destroy]
        resources :reservations, only: [:index, :show, :new, :create, :destroy]
      end
    end
  end
end

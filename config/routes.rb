require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  get 'ai_digger' => 'root#ai_digger'

  resources :technologies, only: :index do
    collection do
      get 'relationships'
      get 'search'
    end
  end
  resources :resources, only: [:index, :show]
end

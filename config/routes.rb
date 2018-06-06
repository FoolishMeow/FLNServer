require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  get 'ai_digger' => 'root#ai_digger'
  get 'layout/:layout' => 'layout#layout', constraints: { layout: /hierarchy|spherical/ }
  get 'layout/all'
  get 'recommand/clear' => 'recommandation#clear'

  resources :technologies, only: :index do
    collection do
      get 'relationships'
      get 'search'
    end
  end
  resources :resources, only: [:index, :show]
end

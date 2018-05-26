Rails.application.routes.draw do
  get 'ai_digger' => 'root#ai_digger'

  resources :technologies, only: :index
  resources :resources, only: [:index, :show]
end

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :meetings , defaults: { format: :json }, only: [:index, :show] do
    resources :agenda_points , defaults: { format: :json }, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

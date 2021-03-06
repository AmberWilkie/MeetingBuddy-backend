Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :meetings , defaults: { format: :json }, only: [:index, :show, :create, :update, :destroy] do
    get '/participants', controller: :meetings, action: :participants
    resources :invites, defaults: { format: :json }, only: [:create, :update]
    resources :agenda_points , defaults: { format: :json }, only: [:index, :show, :create] do
      resources :votes, defaults: { format: :json }, only: [:index, :create, :update]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

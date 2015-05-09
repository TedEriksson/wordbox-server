Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :users, format: 'json' do
    post 'add_friend/:username', action: 'add_friend'
    get 'friend_requests', action: 'friend_requests'
  end
  resources :sentences, format: 'json'
  resources :words, format: 'json'
  resources :friends, format: 'json'

end

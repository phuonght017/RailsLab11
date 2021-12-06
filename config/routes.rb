Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'friend_num#home'
  post '/result', to: 'friend_num#result', as: 'friend_num'
  get '/database', to: 'friend_num#database'
end


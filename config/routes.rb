Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  resources :task_categories
  post 'auth_user' => 'authentication#authenticate_user'

end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

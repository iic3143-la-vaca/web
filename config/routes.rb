Rails.application.routes.draw do
  apipie
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  get 'new_project' => 'pages#new_project'
  get 'project' => 'pages#project'
  # get 'login' => 'pages#login'
  # get 'logout' => 'pages#logout'
end

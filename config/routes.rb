Rails.application.routes.draw do
  # apipie
  apipie

  # devise
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  # custom routes
  root to: 'projects#index'
  resource :projects, only: [:new, :create, :show]

  get 'home' => 'projects#index'
  get 'about' => 'pages#about'

  # Legacy routes
  # get 'new_project' => 'pages#new_project'
  # get 'project' => 'pages#project'
  # get 'login' => 'pages#login'
  # get 'logout' => 'pages#logout'
end

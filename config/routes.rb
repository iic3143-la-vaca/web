Rails.application.routes.draw do
  # apipie
  apipie

  # devise
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  # custom routes
  root to: 'projects#index'
  resources :projects, only: [:show, :new, :create]

  get 'about' => 'pages#about'

  get 'postulations' => 'projects#postulations'
  get 'refuse' => 'projects#refuse_view'
  post 'refuse' => 'projects#refuse_project'

  # Legacy routes
  # get 'new_project' => 'pages#new_project'
  # get 'project' => 'pages#project'
  # get 'login' => 'pages#login'
  # get 'logout' => 'pages#logout'
end

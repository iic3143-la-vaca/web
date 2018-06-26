Rails.application.routes.draw do
  # apipie
  apipie

  # devise
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  # custom routes
  root to: 'projects#index'
  resources :projects, only: [:show, :new, :create, :edit, :update] do
    get 'collaborate'
    post 'collaborate' => 'projects#process_colaboration'
    patch 'accept' => 'projects#accept_project'
  end

  get 'about' => 'pages#about'

  get 'postulations' => 'projects#postulations'
  get 'refuse' => 'projects#refuse_view'
  post 'refuse' => 'projects#refuse_project'

  post 'comment' => 'comments#create'

  # Legacy routes
  # get 'new_project' => 'pages#new_project'
  # get 'project' => 'pages#project'
  # get 'login' => 'pages#login'
  # get 'logout' => 'pages#logout'
end

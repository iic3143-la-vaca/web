class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  before_action :authenticate_user!, only: [:new, :create]

  api :GET, '/'
  def index
    @projects = Project.all
  end

  api :GET, '/projects/:id'
  param :id, :number, required: true
  def show
  end

  api :GET, '/projects/new'
  def new
    @project = Project.new
    3.times { @project.rewards.build }
  end

  api :POST, '/projects'
  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to @project
    else
      render :action => :new
    end
  end

  private

    def project_params
      # whitelist params
      params.require(:project).permit(:title, :description, :goal, 
        :deadline, :financing_description, :creators_description,
        rewards_attributes: [ :id, :name, :description, :lower_bound,
          :upper_bound, :dispatchable]
      )
    end

    def set_project
      @project = Project.find(params[:id])
    end
end

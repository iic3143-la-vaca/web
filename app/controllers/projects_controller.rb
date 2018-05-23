class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  api :GET, '/projects'
  def index
    @projects = Project.all
  end

  api :GET, '/projects.id'
  param :id, String, required: true
  def show
  end

  api :GET, '/projects/new_project'
  def new
    @project = Project.new
  end

  private

    def project_params
      # whitelist params
      params.permit(:id)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end

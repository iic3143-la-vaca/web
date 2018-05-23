class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index
    @projects = Project.all
  end

  def show
  end

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

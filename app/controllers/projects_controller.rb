class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :refuse_view, :refuse_project, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create]

  api :GET, '/'
  def index
    @projects = Project.where(status: 'running')
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
      flash[:success] = "Project created succesfully."
      redirect_to @project
    else
      render action: :new
    end
  end

  api :GET, '/projects/:id/edit'
  param :id, :number, required: true
  def edit
  end

  api :PUT, '/projects/'
  param :id, :number, required: true
  def update
    if @project.update(project_params)
      UserMailer.pending_for_review_email(@project).deliver_now
      flash[:success] = "Project updated succesfully. Wait for admin review"
      redirect_to @project
    else
      render action: :edit
    end
  end

  api :GET, '/postulations'
  def postulations
    @pending_projects = Project.where(status: 'pending')
    @rejected_projects = Project.where(status: 'rejected')
  end

  api :GET, '/refuse'
  param :id, :number, required: true
  def refuse_view
  end

  api :POST, '/refuse'
  param :id, :number, required: true
  param :message, String, required: true
  def refuse_project
    @project.update(status: 'rejected')
    UserMailer.rejection_email(@project, rejection_params[:message]).deliver_now
    @pending_projects = Project.where(status: 'pending')
    @rejected_projects = Project.where(status: 'rejected')
    render 'postulations'
  end

  private

    def project_params
      # whitelist params
      params.require(:project).permit(:title, :description, :goal,
        :deadline, :financing_description, :creators_description, :status,
        rewards_attributes: [ :id, :name, :description, :lower_bound,
          :upper_bound, :dispatchable]
      )
    end

    def rejection_params
      params.permit(:message, :id)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end

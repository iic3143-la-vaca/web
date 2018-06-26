class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :refuse_view, :refuse_project, :edit, :update, :accept_project, :collaborate, :process_colaboration]
  before_action :authenticate_user!, only: [:new, :create, :collaborate, :refuse_view, :refuse_project, :accept_project, :edit, :update, :process_colaboration]

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

  api :PATCH, '/projects/:project_id/accept'
  param :project_id, :number, required: true
  def accept_project
    @project.update(status: 'running')
    @pending_projects = Project.where(status: 'pending')
    @rejected_projects = Project.where(status: 'rejected')
    render 'postulations'
  end

  api :GET, '/projects/:project_id/collaborate'
  param :project_id, :number, required: true
  def collaborate
  end

  api :POST, '/projects/:project_id/collaborate'
  param :project_id, :number, required: true
  def process_colaboration
    @donation = Donation.new(
      user: current_user,
      project: @project,
      amount: collaboration_params[:contribution_amount]
    )
    if @donation.save
      redirect_to project_path(@project)
    else
      render action: :collaborate
    end
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

    def collaboration_params
      params.permit(:contribution_amount, :project_id)
    end

    def set_project
      if not params[:id].nil?
        @project = Project.find(params[:id])
      else
        @project = Project.find(params[:project_id])
      end
    end
end

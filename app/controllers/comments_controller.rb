class CommentsController < ApplicationController
  before_action :set_project, only: [:create]
  # before_action :comment_params, only: [:create]
  # before_action :set_user, only: [:create]
  before_action :authenticate_user!, only: [:create]

  api :POST, '/comment'
  def create
    @comment = Comment.create!(body: comment_params[:comment][:body],
                                 user_id: current_user.id,
                                 project_id: @project.id)
    redirect_to project_path(id: @project.id)
  end

  private

    def comment_params
      params.permit(:id, comment: [:body])
    end

    def set_project
      @project = Project.find(params[:id])
    end
end

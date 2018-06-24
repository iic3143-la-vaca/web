class CommentsController < ApplicationController
  before_action :set_project, only: [:create]
  # before_action :comment_params, only: [:create]
  # before_action :set_user, only: [:create]
  before_action :authenticate_user!, only: [:create]

  # api :POST, '/comment'
  def create
    p comment_params
    p comment_params[:comment]
    p @project

    @comment = Comment.create!(body: comment_params[:comment][:body],
                                 user_id: current_user.id,
                                 project_id: @project.id)
    # p comment_params[:comment]
    # p comment_params[:user_id]
    # p comment_params[:project_id]
    # p comment_params[:body]
    # p 'adfdaf'
    # @comment = Comment.create!(comment_params)
    redirect_to project_path(id: @project.id)
  end

  private

    def comment_params
      p 'asdfnoasdnfo'
      p params
      params.permit(:id, comment: [:body])
    end

    def set_project
      @project = Project.find(params[:id])
    end
end

class NewsController < ApplicationController
  before_action :set_project, only: [:create]
  before_action :authenticate_user!, only: [:create]

  api :POST, '/news'
  def create
    @news = News.create!(headline: news_params[:news][:headline],
                         body: news_params[:news][:body],
                         user_id: current_user.id,
                         project_id: @project.id)
    redirect_to project_path(id: @project.id)
  end

  private

    def news_params
      params.permit(:id, news: [:headline, :body])
    end

    def set_project
      @project = Project.find(params[:id])
    end
end

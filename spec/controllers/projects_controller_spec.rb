require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  let!(:user) { create(:user) }
  let!(:projects_list) { create_list(:project, 10, user:user) }

  describe "GET index" do

    it "assigns @projects" do
      get :index
      expect(assigns(:projects).length).to eq(10)
      expect(assigns(:projects)).to eq(projects_list)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "returns status 200" do
      get :index
      expect(response.status).to eq(200)
    end

  end

  describe "GET show" do

    it "assigns @project" do
      get :show, params: { id: projects_list[1].id }
      expect(assigns(:project)).to eq(projects_list[1])
    end

    it "renders the index template" do
      get :show, params: { id: projects_list[1].id }
      expect(response).to render_template("show")
    end

    it "returns status 200" do
      get :show, params: { id: projects_list[1].id }
      expect(response.status).to eq(200)
    end

  end
end

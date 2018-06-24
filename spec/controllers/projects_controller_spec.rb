require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  let!(:user) { create(:user) }
  let!(:running_projects_list) { create_list(:project, 10, user: user, status: 'running') }
  let!(:pending_projects_list) { create_list(:project, 5, user: user, status: 'pending') }

  describe "GET index" do
    before { get :index }
    let(:running_projects) { Project.where status: 'running' }

    it "assigns @projects" do
      expect(assigns(:projects).length).to eq(10)
      expect(assigns(:projects)).to eq(running_projects)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "returns status 200" do
      expect(response.status).to eq(200)
    end

  end

  describe "GET show" do
    before { get :show, params: { id: running_projects_list[1].id } }
    let(:showing_project) { running_projects_list[1] }

    it "assigns @project" do
      expect(assigns(:project)).to eq(showing_project)
    end

    it "renders the index template" do
      expect(response).to render_template("show")
    end

    it "returns status 200" do
      expect(response.status).to eq(200)
    end

  end

  describe "GET postulations" do
    before { get :postulations }
    let(:pending_projects) { Project.where status: 'pending' }

    it "assigns @project" do
      expect(assigns(:projects)).to eq(pending_projects)
    end

    it "renders the index template" do
      expect(response).to render_template("postulations")
    end

    it "returns status 200" do
      expect(response.status).to eq(200)
    end

  end
end

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:project) { create(:project, user: user1) }

  describe "POST comment" do
    let(:comment) { build(:comment) }
    before { sign_in user2 }
    before { post :create,  params: { id: project.id, comment: { body: comment.body } } }

    it "assigns @project" do
      expect(assigns(:project)).to eq(project)
    end

    it "assigns @comment" do
      expect(assigns(:comment)).to eq(Comment.last)
    end

    it "renders the index template" do
      expect(response).to redirect_to("/projects/#{project.id}")
    end

    it "returns status 302" do
      expect(response.status).to eq(302)
    end
  end

end

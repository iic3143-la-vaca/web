require 'rails_helper'

feature 'Project is posted' do
  let!(:user) { create(:user) }


  scenario 'with valid user credentials' do
    visit new_projects_path
  end

  scenario 'with invalid user credentials' do
  end
end
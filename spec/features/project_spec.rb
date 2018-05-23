require 'rails_helper'

feature 'Project is posted' do
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }


  scenario 'with valid user credentials' do
    login_as(user, scope: :user)
    visit new_projects_path

    fill_in 'project_title', with: project.title
    fill_in 'Description', with: project.description
    fill_in 'Financing', with: project.financing_description
    fill_in 'Project\'s Creator', with: project.about_creators

    fill_in 'Financial Objective', with: project.goal
    fill_in 'Ending Date', with: project.ending_date

    project.rewards.each_with_index do |reward, i|
      fill_in "rewards_attributes[#{i}][description]", with: reward.description
      fill_in "rewards_attributes[#{i}][lower_bound]", with: reward.lower_bound
      fill_in "rewards_attributes[#{i}][upper_bound]", with: reward.upper_bound
      fill_in "rewards_attributes[#{i}][dispatchable]", with: reward.dispatchable
    end

    click_button 'Submit'

    expect(page).to have_text 'Project created succesfully.'
  end

  scenario 'with invalid user credentials' do
    visit new_projects_path
    expect(page.status_code).to eq(401)
  end
end

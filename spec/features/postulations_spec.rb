# require 'rails_helper'
#
# feature 'Admin can see postulations' do
#   let!(:user) { create(:user, role: 'admin') }
#
#   scenario 'with valid user credentials' do
#     login_as(user, scope: :user)
#     # project = create(:project, user: user)
#     visit new_project_path
#
#     fill_in 'project[title]', with: Faker::Company.unique.name
#     fill_in 'project[description]', with: project.description
#     fill_in 'project[financing_description]', with: project.financing_description
#     fill_in 'project[creators_description]', with: project.creators_description
#
#     fill_in 'project[goal]', with: project.goal
#     fill_in 'project[deadline]', with: project.deadline
#
#     project.rewards.each_with_index do |reward, i|
#       fill_in "project[rewards_attributes][#{i}][name]", with: reward.name
#       fill_in "project[rewards_attributes][#{i}][description]", with: reward.description
#       fill_in "project[rewards_attributes][#{i}][lower_bound]", with: reward.lower_bound
#       fill_in "project[rewards_attributes][#{i}][upper_bound]", with: reward.upper_bound
#       if reward.dispatchable
#         check "project[rewards_attributes][#{i}][dispatchable]"
#       end
#     end
#
#     click_button 'Submit'
#
#     expect(page).to have_text 'Project created succesfully.'
#   end
#
#   scenario 'with invalid user credentials' do
#     visit new_project_path
#     expect(page).to have_text 'Log in'
#   end
# end

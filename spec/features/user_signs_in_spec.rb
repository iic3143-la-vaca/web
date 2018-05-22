require 'rails_helper'

feature 'User signs in' do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  scenario 'with valid credentials' do

    visit new_user_session_path

    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully.'
    expect(page).to have_link 'Sign Out'
    expect(page).to have_current_path root_path
  end

  scenario 'with invalid credentials' do

    visit new_user_session_path

    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password + '1234'
    click_button 'Log in'

    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to have_no_link 'Sign Out'
  end
end

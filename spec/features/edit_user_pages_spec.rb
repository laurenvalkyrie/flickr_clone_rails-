require 'rails_helper'

describe 'the edit user feature' do
  it 'edits a user' do
    user = FactoryGirl.create(:user)
    visit images_path
    click_link 'Edit profile'
    fill_in 'Email', :with => 'person@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'Current password', :with => 'password'
    click_button 'Update'
    expect(page).to have_content('Logged in as person@email.com')
  end
end

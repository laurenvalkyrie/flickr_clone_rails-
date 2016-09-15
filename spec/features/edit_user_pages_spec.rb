require 'rails_helper'

describe 'the edit user feature' do
  it 'edits a user' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => 'person@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_link 'Edit profile'
    fill_in 'Email', :with => 'person@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'Current password', :with => 'password'
    click_on 'Update'
    expect(page).to have_content('Logged in as person@email.com')
  end
end

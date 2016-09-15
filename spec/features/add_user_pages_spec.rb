require 'rails_helper'

describe 'the create user process' do
  it 'creates a new user' do
    visit images_path
    click_link 'Sign up'
    page.attach_file("user_image", Rails.root + 'app/assets/images/teacup_sloth.jpg')
    fill_in 'Username', :with => 'generic_user'
    fill_in 'Email', :with => 'person@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign Up'
    expect(page).to have_content 'Logged in'
  end
  it 'allows an existing user to login' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', :with => 'person@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    expect(page).to have_content 'Logged in as person@email.com'
  end
end

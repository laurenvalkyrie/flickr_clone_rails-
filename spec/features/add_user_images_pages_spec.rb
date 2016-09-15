require 'rails_helper'

describe 'the add images feature' do
  it 'allows a user to add an image' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => 'person@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_link 'Add new photo'
    fill_in 'Caption', with: 'Hello'
    page.attach_file("Image", 'public/images/Jon-Snow.jpg')
    click_button 'Upload'
    expect(page).to have_content 'Hello'
  end
end

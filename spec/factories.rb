FactoryGirl.define do
  factory(:user) do
    image { File.new("#{Rails.root}/app/assets/images/teacup_sloth.jpg")}
    email("person@email.com")
    username("generic_user")
    password("password")
    password_confirmation('password')
end

  factory(:image) do
    caption('a sloth!')
    user
    image('sloth.jpeg')
  end
end

require 'rails_helper'

feature 'User signs in' do
  background do
    User.create(name: 'Jane Doe', username: 'jodi')
  end

  scenario 'with username' do
    sign_in_with 'jodi'

    expect(page).to have_content 'Log Out'
  end

  scenario 'with invalid username' do
    sign_in_with 'jd'

    expect(page).to have_content "Incorrect username or Sign up if you don't have an account"
  end
end

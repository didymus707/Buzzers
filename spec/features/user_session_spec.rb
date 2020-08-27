require 'rails_helper'

feature 'User signs in' do
  let(:art) do
    create(:article)
  end

  scenario 'with username' do
    sign_in_with art.author.username

    expect(page).to have_content 'New Article'
  end

  scenario 'with invalid username' do
    sign_in_with 'jd'

    expect(page).to have_content "Incorrect username or Sign up if you don't have an account"
  end
end

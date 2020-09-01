require 'rails_helper'

feature 'User can create article' do
  art = FactoryBot.build(:article)
  cat = FactoryBot.build(:category)

  scenario 'successfully' do
    sign_up art.author.name, art.author.username
    sign_in_with art.author.username

    click_on 'New Article'
    fill_in 'Title', with: art.title
    attach_file 'Image', File.join(Rails.root, './spec/fixtures/messi.png')
    fill_in 'Text', with: art.text
    within('.category') do
      fill_in 'Name', with: cat.name
      fill_in 'Priority', with: cat.priority
    end
    click_button 'Create Article'

    expect(page).to have_content art.title
  end

  scenario 'with invalid username' do
    sign_in_with 'jd'

    expect(page).to have_content "Incorrect username or Sign up if you don't have an account"
  end
end

require 'rails_helper'

feature 'User can create article' do
  let(:art) do
    build(:article)
  end

  scenario 'successfully' do
    sign_up art.author.name, art.author.username
    sign_in_with art.author.username
    
    click_on 'New Article'
    fill_in 'Title', with: art.title
    attach_file 'Image', art.image
    fill_in 'Text', with: art.text
    check 'Sports'
    click_button 'Create Article'
    
    expect(page).to have_content art.title

  end

  scenario 'with invalid username' do
    sign_in_with 'jd'

    expect(page).to have_content "Incorrect username or Sign up if you don't have an account"
  end
end

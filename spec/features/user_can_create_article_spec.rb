require 'rails_helper'

feature 'User can create article' do
  # let(:art) do
  #   create(:article)
  # end
  before :each do
    User.create(name: 'Jane Doe', username: 'jodi')
    Article.create(title: 'Suarez', image: './spec/fixtures/suarez.jpg', text: 'One of the greatest striker ever')
  end
  

  scenario 'successfully' do
    # puts '++++++++++++++++++++++++++++++++++'
    # puts art.new_record?
    # puts art.author.username
    # puts art.title
    # puts art.image.present?
    # puts art.text
    # puts '++++++++++++++++++++++++++++++++++'
    sign_up 'Jane Doe', 'jodi'
    sign_in_with 'jodi'
    
    click_on 'New Article'
    fill_in 'Title', with: 'Suarez'
    attach_file 'Image', './spec/fixtures/suarez.jpg', visible: false
    fill_in 'Text', with: 'One of the greatest striker ever'
    check 'Sports'
    click_button 'Create Article'
    
    expect(page).to have_content art.title

  end

  scenario 'with invalid username' do
    sign_in_with 'jd'

    expect(page).to have_content "Incorrect username or Sign up if you don't have an account"
  end
end

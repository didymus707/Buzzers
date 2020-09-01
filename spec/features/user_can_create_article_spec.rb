require 'rails_helper'

feature 'User can create article' do
  # let(:art) do
  #   build(:article)
  # end

  # let(:cat) do
  #   build(:category)
  # end
  background do
    User.create(name: 'Jane Doe', username: 'jodi')
    Article.create(title: 'Suarez', image: './spec/fixtures/suarez.jpg', text: 'One of the greatest striker ever')
    Category.create(name: 'Sports', priority: 1)
  end

  scenario 'successfully' do
    sign_up 'Jane Doe', 'jodi' # art.author.name, art.author.username
    sign_in_with 'jodi' #art.author.username

    click_on 'New Article'
    fill_in 'Title', with: 'Suarez' #art.title 
    attach_file 'Image', './spec/fixtures/messi.png' #art.image 
    fill_in 'Text', with: 'One of the greatest striker ever' #art.text 
    within('.category') do
      fill_in 'Name', with: 'Sports'
      fill_in 'Priority', with: 1
    end
    click_button 'Create Article'

    expect(page).to have_content 'Suarez' #art.title
  end

  scenario 'with invalid username' do
    sign_in_with 'jd'

    expect(page).to have_content "Incorrect username or Sign up if you don't have an account"
  end
end

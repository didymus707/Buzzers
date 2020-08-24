require 'rails_helper'

feature 'User vists homepage' do

  scenario 'succesfully' do
    sign_up('Jane Doe', 'jodi')

    puts '---------------------------'
    puts page.body
    puts '---------------------------'

    expect(page).to have_text 'New Article'
  end
end

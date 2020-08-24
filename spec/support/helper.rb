module Features
  def sign_up(name, username)
    visit new_user_path

    fill_in 'Name', with: name
    fill_in 'Username', with: username

    click_on 'Sign up'
  end

  def sign_in_with(username)
    visit login_path

    fill_in 'Username', with: username

    click_on 'Log in'
  end
end

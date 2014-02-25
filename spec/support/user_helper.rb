module UserHelper

  def register_user(user)
    visit "/"
    click_on "Sign Up"
    fill_in "Email",  with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_on "Create my account!"
  end

end

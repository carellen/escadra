RSpec.configure do
  def sign_up_and_log_in
    visit '/users/sign_up'
    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    sleep 0.1
    open_email 'user@example.com'
    visit_in_email 'Confirm my account'
    visit '/'
    fill_in 'header_user_email', with: 'user@example.com'
    fill_in 'header_user_password', with: 'password'
    click_on 'Login'
  end

  def log_in_as_admin
    page.driver.browser.basic_authorize(ENV['admin_login'], ENV['admin_password'])
  end
end
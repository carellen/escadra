RSpec.configure do
  def log_in
    visit '/'
    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'password'
    click_on 'Login'
  end

  def log_in_as_admin
    page.driver.browser.basic_authorize(ENV['admin_login'], ENV['admin_password'])
  end
end
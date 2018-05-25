describe 'the admin area is secure', type: :feature do
  let!(:user) { create(:user) }

  it 'succeed when admin try to access admin area' do
    log_in_as_admin
    visit '/admin/main'
    expect(page).to have_http_status(200)
  end

  it 'fail when guest try to access admin area' do
    visit '/admin/main'
    expect(page).to have_http_status(401)
  end

  it 'fail when user try to access admin area' do
    sign_up_and_log_in
    visit '/admin/main'
    expect(page).to have_http_status(401)
  end
end
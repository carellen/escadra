feature 'Admin invite new user', js: true do

  before do
    visit 'http://admin:admin@localhost:5000/admin/manage/users'
    fill_in 'email', with: 'test@new.user'
    click_on 'Invite User'
  end

  it 'send invitation' do
    sleep 0.1
    visit 'http://admin:admin@localhost:5000/admin/manage/users'
    within('#users_table_body') do
      expect(page).to have_content 'test@new.user'
      expect(page).to have_content 'Await confirmation...'
    end
  end

  context 'user accept invitation' do

    before do
      sleep 0.1
      open_email 'test@new.user'
      visit_in_email 'Accept invitation'

      fill_in 'user_password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_on 'Set my password'
    end

    it 'accepts invitation' do
      expect(page).to have_content 'Your password was set successfully.'
    end

    it 'shows accepted status' do
      visit 'http://admin:admin@localhost:5000/admin/manage/users'

      within('#users_table_body') do
        expect(page).to have_content 'Confirmed'
      end
    end
  end

end
feature 'user_manage_companies' do

  let!(:company) { create :company }
  before { sign_up_and_log_in }

  context 'crud_operations' do

    it 'create company' do
      visit '/companies'
      click_on 'New company'
      fill_in 'UNP', with: '123456789'
      fill_in 'Company name', with: 'Example company'
      click_on 'Save'
      expect(page).to have_content 'Company was successfully created.'
    end

    it 'show company' do
      visit '/companies'
      within("#company_#{company.id}") do
        click_on 'Show'
      end
      expect(page).to have_content('123456789')
    end

    it 'edit company' do
      visit '/companies'
      within("#company_#{company.id}") do
        click_on 'Edit'
      end
      fill_in 'Company name', with: 'Unique company'
      click_on 'Save'
      expect(page).to have_content 'Unique company'
    end

    it 'delete company' do
      visit '/companies'
      within("#company_#{company.id}") do
        click_on 'Destroy'
      end
      expect(page).not_to have_content 'Example company'
    end

    context 'user can manage only his companies' do

      before do
        second_user = create(:user, id: 2, email: 'second@user.com')
        create(:company, name: 'Another company', user: second_user)
      end

      it 'shows only user`s companies' do
        visit '/companies'
        expect(Company.count).eql?2
        expect(page).to have_content 'Example company'
        expect(page).not_to have_content 'Another company'
      end
    end

  end
end
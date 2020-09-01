RSpec.describe 'as a user' do
  describe 'when I visit "/" and select Gryffindor from dropdown' do

    before :each do

      visit '/'
      select 'Gryffindor', from: :house
      click_on 'Search For Members'
    end

    it 'return total number of Order of the Phoenix members that belong to Gryffindor (21)' do
      #
      expect(current_path).to eq(search_path)
      expect(page).to have_content('21 members')
    end

    it 'I should also see a list with the detailed information for the 21 members: member name, role (if it exists), house, patronus (if it exists)' do
      #
      expect(page).to have_css('.member-details', count: 21)
      save_and_open_page
      within(first('.member-details')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.role')
        expect(page).to have_css('.house')
        expect(page).to have_css('.patronus')
      end

      within('#member-5a0fa7dcae5bc100213c2338') do
        expect(page).to have_content("Sirius Black")
        expect(page).to have_content("Role: none listed!")
        expect(page).to have_content("Patronus: none listed!")
      end
    end
  end
end

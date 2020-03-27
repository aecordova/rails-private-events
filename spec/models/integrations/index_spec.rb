RSpec.describe 'Hello world', type: :feature do
    scenario 'index page' do
      visit root_path
      expect(page).to have_content('Private Events App')
      expect(page).to have_content('Sign Up')
      expect(page).to have_content('Log in')
    end
  end
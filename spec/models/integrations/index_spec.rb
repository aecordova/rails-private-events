RSpec.describe 'Hello world', type: :feature do
  scenario 'index page' do
    visit root_path
    expect(page).to have_content('Private Events App')
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Log in')
  end

  feature 'Visitor signs up' do
    scenario 'should sign up' do
      sign_up_with 'example', 'example@example.com'
      expect(page).to have_content('Log Out')
    end

    scenario 'should not sign up with invalid email ' do
      sign_up_with 'example', 'example@'
      expect(page).to have_content('Email is invalid')
    end

    scenario 'should not sign up with no name ' do
      sign_up_with '', 'example@example.com'
      expect(page).to have_content("Name can't be blank")
    end
  end

  feature 'visitor log in' do
    scenario 'sould log in' do
      sign_up_with 'example', 'example@example.com'
      click_link 'Log Out'
      log_in_with('example@example.com')
      expect(page).to have_content('example')
    end

    scenario 'should not log in with user not registered' do
      log_in_with('example@example.com')
      expect(page).to have_content("User doesn't exist")
    end
  end

  feature 'Visitor log Out' do
    scenario 'sould return to index after log out' do
      sign_up_with 'example', 'example@example.com'
      click_link 'Log Out'
      expect(page).to have_content('Private Events App')
      expect(page).to have_content('Sign Up')
      expect(page).to have_content('Log in')
    end
  end

  feature 'Should create an event' do
    scenario 'visitor can create an event' do
      sign_up_with 'example', 'example@example.com'
      click_link 'New Event'
      expect(page).to have_content('Event information:')
      create_event_with('My event', 'This is my new event', DateTime.now, 'In the park')
      expect(page).to have_content('Event created successfully')
    end

    scenario 'visitor cannot create an event witout name' do
      sign_up_with 'example', 'example@example.com'
      click_link 'New Event'
      expect(page).to have_content('Event information:')
      create_event_with('', 'This is my new event', DateTime.now, 'In the park')
      expect(page).to have_content("Name can't be blank")
    end
  end

  feature 'register to another event' do
    scenario 'visitor can register to an existing event' do
      sign_up_with 'example', 'example@example.com'
      click_link 'New Event'
      expect(page).to have_content('Event information:')
      create_event_with('My event', 'This is my new event', DateTime.now, 'In the park')
      expect(page).to have_content('Event created successfully')
      click_link 'Log Out'
      sign_up_with 'foo', 'foo@bar.biz'
      visit events_path
      expect(page).to have_content('Register')
      click_link 'Register'
      expect(page).to have_content('Successfully registered to event')
    end
  end

  def sign_up_with(name, email)
    visit signup_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    click_button 'Create User'
  end

  def log_in_with(email)
    visit login_path
    fill_in 'Email', with: email
    click_button 'Log In'
  end

  def create_event_with(name, description, date, place)
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    fill_in 'Date', with: date
    fill_in 'Place', with: place
    click_button 'Create Event'
  end
end

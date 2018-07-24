require 'rails_helper'

RSpec.feature "Visitor logs in", type: :feature, js: true do
  # TEMPORARY SETUP
  before :each do
    # create a new user
    User.create! first_name:'test', last_name:'test', email:'test@test.com', password:'12345', password_confirmation:'12345'
  end

  scenario "User fills out a log in form and successfully logs in" do
    # ACT
    # go to the log in page
    visit new_session_path
    # fill in the log in form
    within 'form.new_user' do
      # fill_in <input name>, with: <value>
      fill_in 'email', with: 'test@test.com'
      fill_in 'password', with: '12345'
    end
    # click on the submit button
    click_on 'Submit'

    # DEBUG
    # save screenshot of home page
    page.save_screenshot('login_page.png')

    # # VERIFY
    expect(page).to have_selector('section.products-index')
  end
end

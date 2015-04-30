require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path of address book', {:type => :feature}) do
  before() do
    Contact.clear()
  end

  it('processes the user input and directs user to contacts page') do
    visit('/')
    click_link('Add New Contact')
    fill_in('first_name', :with => 'Bob')
    fill_in('last_name', :with => 'Dylan')
    fill_in('birth_month', :with => 'July')
    click_button('Add Contact')
    click_link('List of Contacts')
    expect(page).to have_content('These are your contacts')
  end
end

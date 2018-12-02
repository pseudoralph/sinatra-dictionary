require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe 'Add word to dictionary', {:type => :feature} do
  it do
    visit '/dictionary/add_word'
    fill_in 'word', with: 'Hello'
    click_button 'Submit'
    expect(page).to have_content("Hello")
  end

end

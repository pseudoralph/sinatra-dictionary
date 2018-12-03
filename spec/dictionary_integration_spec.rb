require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe 'Word definer', {:type => :feature} do
  it 'adds a single word to the dictionary' do
    visit '/dictionary/add_word'
    fill_in 'word', with: 'Hello'
    click_button 'Submit'
    expect(page).to have_content("Hello")
  end

  it 'loads sample dictionary (no definitions)' do
    visit '/'
    click_link 'options'
    click_link 'reset and prepopulate'
    expect(page).to have_content("Albumen")
  end

  it 'adds a definition to Albumen (sample dictionary)' do
    visit '/'
    click_link 'options'
    click_link 'reset and prepopulate'
    click_link 'Albumen'
    click_link 'add a definition'
    fill_in 'definition', with: 'egg white (as well as a type of protein found in egg whites and milk)'
    click_button 'Add definition'
    expect(page).to have_content("egg white (as well as a type of protein found in egg whites and milk)")
  end

end

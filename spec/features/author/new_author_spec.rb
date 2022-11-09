require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should have text input field for ab authors first name, last name and homepage" do
    visit new_author_path
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should create a new author in the database" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Ada'
    page.fill_in 'author[last_name]', with: 'Lovelace'
    page.fill_in 'author[homepage]', with: 'https://de.wikipedia.org/wiki/Ada_Lovelace'
    find('input[type="submit"]').click
  end
end

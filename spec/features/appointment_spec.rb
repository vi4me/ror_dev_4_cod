require 'rails_helper'

describe 'Accessing doctor', type: :feature do

  before(:each) do
    visit root_path
    click_link "Sign up"
    fill_in :user_email, with: "bob@mail.ru"
    fill_in :user_password, with: "qweqweqwe"
    fill_in :user_password_confirmation, with: "qweqweqwe"
    click_button "Sign up"
  end

  it "doesn't show word Foo" do
    expect(page).not_to have_content "Foo"
  end

  it "show word Categories" do
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it "check as doctor" do
    click_link "My Profile"
    find(:css, "#user_doctor").set(true)
    click_button 'Save'
    click_link "Back"
    expect(page).to have_content "Welcome, bob@mail.ru"
  end

  describe 'create recommendation' do

    before(:each) do
      Category.create!(title: 'Psihology', user_id: 1)
    end

    it "has a valid Category" do
      expect(Category.create!(title: 'Psihology', user_id: 1)).to be_valid
    end

    xit "add recommendation" do
      binding.pry
      click_link 'Psihology'
      # find(:css, ".category_title").click_link
      # visit '/categories/1'
      click_link 'Show'
      find(:css, ".appointment_body").click_link
      click_link 'Рекомендация'
      fill_in :appointment_body, with: "Wear a hat and wash your hands!"
      click_button 'Submit'
      click_link 'Show'
      expect(page).not_to have_css ".appointment_body"
    end
  end

end

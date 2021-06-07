# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'is invalid without email' do
     person = FactoryBot.build(:user, email: nil)
     expect(person).not_to be_valid
  end

  it 'is valid with email' do
    person = FactoryBot.build(:user, email: 'johnny_wallker@gmail.com')
    expect(person.email).to eq('johnny_wallker@gmail.com')
  end

  it 'is invalid without password' do
     person = FactoryBot.build(:user, password: nil)
     expect(person).not_to be_valid
  end

  it 'validations for uniqueness' do
    should validate_uniqueness_of(:email).ignoring_case_sensitivity
  end
end

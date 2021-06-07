# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :request do
  before(:each) do
    user = FactoryBot.create(:user)
    sign_in user
  end

  let(:valid_attributes) {
    { title: 'Fill', user_id: 1 }
  }

  let(:invalid_attributes) {
    { title: '', user_id: 1 }
  }

  it 'has a valid factory' do
    expect(FactoryBot.build(:category)).to be_valid
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      FactoryBot.build(:category)
      get '/categories'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'create a new Category' do
        expect {
          post '/categories', params: { category: valid_attributes }
        }.to change(Category, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Category' do
        expect {
          post '/categories', params: { category: invalid_attributes }
        }.to change(Category, :count).by(0)
      end

      it "renders a successful response with invalid_attributes (i.e. to display the 'new' template)" do
        post '/categories', params: { category: invalid_attributes }
        expect(response).to have_http_status(200)
      end
    end
  end
end

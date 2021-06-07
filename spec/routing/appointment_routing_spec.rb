# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppointmentsController, type: :routing do
  describe 'routing' do
    let(:categories) { create :category }
    it 'routes to #index' do
      expect(get: '/categories/appointment').to be_routable
    end
  end
end

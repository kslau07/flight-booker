# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Flights', type: :request do
  describe 'GET /flights' do
    it 'renders a successful response' do
      get '/flights'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/flights'
    expect(response).to render_template('index')
    end
  end
end

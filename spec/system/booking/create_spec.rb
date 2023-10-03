# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Create a new booking', type: :system do
  before do
    create(:airport, :los_angeles)
    create(:airport, :new_york_city)
    create(:flight)
  end

  scenario 'A user creates a booking starting at the root path' do
    visit '/'
    # select "departure_code", :from => "departure_code"
    # sleep 60

    # select "option_name_here", :from => "organizationSelect"
  end
end


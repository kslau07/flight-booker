# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Create a new booking', type: :system do
  before do
    create(:airport, :atlanta)
    create(:airport, :chicago)
    create(:airport, :new_york)
    create(:airport, :los_angeles)
    # Create flights
  end

  scenario 'A user creates a booking starting at the root path' do
    visit '/'
    sleep 15

    # select "departure_code", :from => "departure_code"

    # select "option_name_here", :from => "organizationSelect"
  end
end

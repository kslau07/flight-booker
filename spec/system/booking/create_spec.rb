# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Create a new booking', type: :system do
  scenario 'A user creates a booking starting at the root path' do
    atlanta = create(:airport, :atlanta)
    chicago = create(:airport, :chicago)
    new_york = create(:airport, :new_york)
    los_angeles = create(:airport, :los_angeles)
    create(:flight, departure_airport: atlanta, arrival_airport: chicago)
    create(:flight, departure_airport: new_york, arrival_airport: los_angeles)

    visit '/'
    sleep 15

    # select "departure_code", :from => "departure_code"

    # select "option_name_here", :from => "organizationSelect"
  end
end

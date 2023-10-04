# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Create a new booking', type: :system do
  scenario 'A user creates a booking starting at the root path' do
    create_list(:flight, 3)

    visit '/'
    sleep 5

    # select "departure_code", :from => "departure_code"
    # select "option_name_here", :from => "organizationSelect"
  end
end

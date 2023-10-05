# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Create a new booking', type: :system do
  context 'When a user enters valid inputs for forms' do
    before do
      create_list(:flight, 3, seats_avail: 4)
    end

    scenario 'When 4 tickets are booked successfully, user sees a confirmation at the end' do
      visit '/'
      first('#departure_code', minimum: 1).select_option
      find('#departure_code').send_keys(:down)
      find('#arrival_code').send_keys(:down, :down)
      select('4', from: 'num_tickets')
      click_button 'Search Flights'
      expect(page).to have_css('input[type="radio"]')
      first('input[type="radio"]').click
      click_button 'Continue'
      expect(page).to have_content('Continue Booking Trip')

      within(all('.booking-form__details-container')[0]) do
        find(:css, 'input[name*=name]').set 'John Smith' # uses * matcher
        find(:css, 'input[name*=email]').set 'john@test.com'
      end

      within(all('.booking-form__details-container')[1]) do
        find(:css, 'input[name*=name]').set 'Jane Smith'
        find(:css, 'input[name*=email]').set 'jane@test.com'
      end

      within(all('.booking-form__details-container')[2]) do
        find(:css, 'input[name*=name]').set 'Dave Smith'
        find(:css, 'input[name*=email]').set 'johnjr@test.com'
      end

      within(all('.booking-form__details-container')[3]) do
        find(:css, 'input[name*=name]').set 'Wendy Smith'
        find(:css, 'input[name*=email]').set 'Wendy@test.com'
      end

      click_button 'Book Flight!'
      expect(page).to have_content 'Here is your flight and ticket information:'
    end
  end
end

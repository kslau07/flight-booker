# frozen_string_literal: true

require 'rails_helper'

# TODO: Add another system test with invalid inputs
# TODO: Learn about services
# TODO: Redo mailer, look at more indepth options
# TODO: Write model tests for one model

RSpec.feature 'Create a new booking', type: :system do
  context 'When the user provides incorrect or invalid form inputs,' do
    before do
      create_list(:flight, 3, seats_avail: 4)
      visit '/'
      first('#departure_code', minimum: 1).select_option
      find('#departure_code').send_keys(:down)
      find('#arrival_code').send_keys(:down, :down)
      select('1', from: 'num_tickets')
      click_button 'Search Flights'

      expect(page).to have_css('table[id="flight-search-results"]')
      expect(page).to have_css('input[type="radio"]')
      first('input[type="radio"]').click
      click_button 'Continue'
      expect(page).to have_content('Continue Booking Trip')
    end

    scenario 'When the user submits a form leaving "Name" blank, a js tooltip is displayed (chrome).' do
      within(all('.booking-form__details-container')[0]) do
        find(:css, 'input[name*=name]').set ''
      end

      click_button 'Book Flight!'
      message =
        find(:css, 'input[name*=name]').native.attribute('validationMessage') # js tooltip in chrome
      expect(message).to eq 'Please fill out this field.'
    end

    scenario 'When the user submits a form leaving "Email" blank, a js tooltip is displayed (chrome).' do
      within(all('.booking-form__details-container')[0]) do
        find(:css, 'input[name*=name]').set 'John Smith'
        find(:css, 'input[name*=email]').set ''
      end

      click_button 'Book Flight!'
      message =
        find(:css, 'input[name*=email]').native.attribute('validationMessage')
      expect(message).to eq 'Please fill out this field.'
    end

    scenario 'When the user submits a form with an invalid email address, a js tooltip is displayed (chrome).' do
      within(all('.booking-form__details-container')[0]) do
        find(:css, 'input[name*=name]').set 'John Smith'
        find(:css, 'input[name*=email]').set 'not_email'
      end

      click_button 'Book Flight!'
      message =
        find(:css, 'input[name*=email]').native.attribute('validationMessage')
      expect(message).to eq "Please include an '@' in the email address. 'not_email' is missing an '@'."
    end
  end
end

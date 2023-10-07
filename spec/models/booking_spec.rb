# == Schema Information
#
# Table name: bookings
#
#  id          :integer          not null, primary key
#  num_tickets :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  flight_id   :integer          not null
#
# Indexes
#
#  index_bookings_on_flight_id  (flight_id)
#
# Foreign Keys
#
#  flight_id  (flight_id => flights.id)
#
require 'rails_helper'

RSpec.describe Booking, type: :model do
  it { should belong_to :flight }
  it { should have_many :passengers }
  it { should accept_nested_attributes_for :passengers }
end

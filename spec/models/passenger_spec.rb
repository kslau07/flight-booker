# == Schema Information
#
# Table name: passengers
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  booking_id :integer          not null
#
# Indexes
#
#  index_passengers_on_booking_id  (booking_id)
#
# Foreign Keys
#
#  booking_id  (booking_id => bookings.id)
#
require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it { should belong_to :booking }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
end

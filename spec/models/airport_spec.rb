# frozen_string_literal: true

# == Schema Information
#
# Table name: airports
#
#  id         :integer          not null, primary key
#  code       :string           not null
#  latitude   :float            not null
#  location   :string           not null
#  longitude  :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

# TODO: Learn about services
# TODO: Add system test for booking to test 'add passenger' button
# TODO: Redo mailer, look at more indepth options

RSpec.describe Airport, type: :model do
  describe 'Associations' do
    it {
      should have_many(:departing_flights)
        .class_name('Flight')
        .with_foreign_key('departure_airport_id')
    }
    it {
      should have_many(:arriving_flights)
        .class_name('Flight')
        .with_foreign_key('arrival_airport_id')
    }
  end

  describe 'Validations' do
    subject { build(:airport) }

    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end
end

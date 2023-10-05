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

# NOTE: delete me
# What is the input?
# What is the expected output?
# A lot of software engineering boils down to these two questions.

RSpec.describe Airport, type: :model do
  let(:airport) do
    described_class.create(code: 'ABC', location: 'Anywhere, USA', latitude: '42.42', longitude: '-42.42')
  end

  describe '#code' do
    subject(:code) { airport.code }

    it 'returns the airport\'s IATA code' do
      expect(code).to eq('ABC')
    end
  end

  describe '#location' do
    subject(:location) { airport.location }

    it "returns the airport's location" do
      expect(location).to eq('Anywhere, USA')
    end
  end

  describe '#latitude' do
    subject(:latitude) { airport.latitude }

    it "returns the airport's latitude" do
      expect(latitude).to eq(42.42)
    end
  end

  describe '#longitude' do
    subject(:longitude) { airport.longitude }

    it "returns the airport's longitude" do
      expect(longitude).to eq(-42.42)
    end
  end
end

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

# NOTE: delete me
# Test behavior, not implementation
# Validations are behavior
# Associations are structure (and do not have to be tested, although they can be)

RSpec.describe Airport, type: :model do
  let!(:airport) do
    described_class.new(code:, location:, latitude:, longitude:)
  end

  describe '#valid?' do
    subject { airport.valid? }
    let!(:code) { 'ABC' }
    let!(:location) { 'Anywhere, USA' }
    let!(:latitude) { '42.42' }
    let!(:longitude) { '-42.42' }

    context 'when Airport contains only valid attributes' do
      it { is_expected.to be true }
    end

    context 'when Airport contains an invalid "location"' do
      let(:location) { '' }
      it { is_expected.to be false }
    end

    context 'when Airport contains an invalid "latitude"' do
      let(:latitude) { '' }
      it { is_expected.to be false }
    end

    context 'when Airport contains an invalid "longitude"' do
      let(:longitude) { '' }
      it { is_expected.to be false }
    end
  end

  describe 'Validations' do
    it { should validate_presence_of(:code) }
  # it { should validate_presence_of(:title) }
    # it { is_expected.to validate_inclusion_of(:code) }
    # it { is_expected.to validate_inclusion_of(:gender).in_array(%i[gender_neutral non_binary male female other]) }
  end

  # before { FactoryBot.build(:user) }
  # it do
  #   should validate_uniqueness_of(:username)
  #     .scoped_to(:account_id)
  #     .case_insensitive
  # end
end

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

RSpec.describe Airport, type: :model do
  describe 'Associations' do
    it { should have_many(:departing_flights) }
    it { should have_many(:arriving_flights) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end
end

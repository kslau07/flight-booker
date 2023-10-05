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
class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight',
                               foreign_key: :departure_airport_id,
                               dependent: :destroy
  has_many :arriving_flights, class_name: 'Flight',
                              foreign_key: :arrival_airport_id,
                              dependent: :destroy

  validates :code, presence: true
  validates :location, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end

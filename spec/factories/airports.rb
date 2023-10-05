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

FactoryBot.define do
  sequence(:code, 'AAA')

  factory :airport do
    code { generate(:code) }
    location { "#{Faker::Address.city}, #{Faker::Address.state_abbr}" }
    latitude { 111.111 }
    longitude { -111.111 }
  end
end

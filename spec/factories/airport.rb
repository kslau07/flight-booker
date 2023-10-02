# frozen_string_literal: true

FactoryBot.define do
  factory :airport do
    # NOTE: delete me
    # trait :atlanta do
    #   code { 'ATL' }
    # end
    #
    # trait :dallas do
    #   code { 'DFW' }
    # end
    #
    # trait :denver do
    #   code { 'ORD' }
    # end
    #
    trait :los_angeles do
      code { 'LAX' }
    end

    trait :new_york_city do
      code { 'JFK' }
    end
  end
end

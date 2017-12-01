
FactoryBot.define do
  factory :exchange_rate do
    value 58.31
    nominal 1
    datetime '01-12-2017 12:44'


    trait :invalid do
      datetime 'qtrt4545'
    end

    factory :invalid_rate, traits: [:invalid]
  end
end

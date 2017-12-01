
FactoryBot.define do
  factory :exchange_rate do
    value 58.31
    nominal 1
    datetime { DateTime.current + 1.hour }


    trait :invalid do
      datetime 'qtrt4545'
    end

    factory :invalid_rate, traits: [:invalid]
  end
end

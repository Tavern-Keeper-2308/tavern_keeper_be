FactoryBot.define do
  factory :encounter do
    user_id { rand(2..3) }
    encounter_name { Faker::JapaneseMedia::StudioGhibli.quote }
    party_size { rand(1..4) }
    party_level { rand(1..20) }
    summary { Faker::Fantasy::Tolkien.poem }
    description { Faker::Books::Lovecraft.paragraph }
    treasure { Faker::Games::ElderScrolls.jewelry }
  end
end

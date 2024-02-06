FactoryBot.define do
  factory :encounter do
    user_id { 1 }
    encounter_name { Faker::Books::Lovecraft.fhtagn }
    party_size { rand(1..4) }
    party_level { rand(1..20) }
    summary { Faker::Books::Lovecraft.paragraph }
    description { Faker::Fantasy::Tolkien.poem }
    treasure { Faker::Games::ElderScrolls.jewelry }
  end
end

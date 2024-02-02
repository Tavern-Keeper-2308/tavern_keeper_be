FactoryBot.define do
  factory :encounter do
    encounter_name { Faker::Books::Lovecraft.fhtagn }
    party_size { (1..4).to_a.sample }
    party_level { (1..20).to_a.sample }
    summary { Faker::Books::Lovecraft.paragraph }
    description { Faker::Fantasy::Tolkien.poem }
    treasure { Faker::Games::ElderScrolls.jewelry }
  end
end

FactoryBot.define do
  factory :encounter_monster do
    association :encounter
    monster_name { Faker::Games::Witcher.monster }
  end
end

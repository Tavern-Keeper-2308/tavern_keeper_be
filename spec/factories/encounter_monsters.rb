FactoryBot.define do
  factory :encounter_monster do
    association :encounter
    monster_name { "goblin" }
  end
end

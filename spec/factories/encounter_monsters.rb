FactoryBot.define do
  factory :encounter_monster do
    association :encounter
    monster_name { "Goblin" }
    monster_index { "goblin" }
  end
end

module Types
  class MonsterType < Types::BaseObject
    field :monster_index, String
    field :monster_name, String
    field :challenge_rating, String
    field :image, String
    field :size, String
    field :type, String
    field :alignment, String
    field :armor_class, String
    field :speed, Types::SpeedType
    field :hit_points, Int
    field :strength, Int
    field :dexterity, Int
    field :constitution, Int
    field :intelligence, Int
    field :wisdom, Int
    field :charisma, Int
    field :languages, String
    field :special_abilities, [Types::SpecialAbilityType]
    field :actions, [Types::ActionType]
    field :legendary_actions, [Types::LegendaryActionType]
    field :proficiencies, [Types::ProficiencyType]
    field :damage_vulnerabilities, String
    field :damage_resistances, String
    field :damage_immunities, String
    field :senses, Types::SenseType
    field :proficiency_bonus, Int
    field :condition_immunities, [String]
  end
end

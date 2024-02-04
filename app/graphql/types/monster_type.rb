module Types
  class MonsterType < Types::BaseObject
    field :index, String
    field :name, String
    field :challenge_rating, String
    field :image, String
    field :size, String
    field :type, String
    field :alignment, String
    field :armor_class, String
    field :speed, Types::SpeedType, null: true
    field :hit_points, Int
    field :strength, Int
    field :dexterity, Int
    field :constitution, Int
    field :intelligence, Int
    field :wisdom, Int
    field :charisma, Int
    field :languages, String
    field :special_abilities, [Types::SpecialAbilityType], null: true
    field :actions, [Types::ActionType], null: true
    field :legendary_actions, [Types::LegendaryActionType], null: true
  end
end


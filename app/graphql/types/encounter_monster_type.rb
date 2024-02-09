# frozen_string_literal: true

module Types
  class EncounterMonsterType < Types::BaseObject
    field :id, ID, null: false
    field :encounter_id, Integer, null: false
    field :monster_name, String
    field :monster_index, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

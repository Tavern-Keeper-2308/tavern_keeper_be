# frozen_string_literal: true

module Types
  class EncounterType < Types::BaseObject
    field :id, ID, null: false
    field :user_name, String, null: false
    field :encounter_name, String
    field :party_size, Integer
    field :party_level, Integer
    field :summary, String
    field :description, String
    field :treasure, String
    field :encounter_monsters, [Types::EncounterMonsterType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_encounter, mutation: Mutations::CreateEncounter
  end
end

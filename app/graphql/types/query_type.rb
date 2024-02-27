# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    
    field :monsters, [Types::MonsterType], null: false,
      description: "A complete list of Monsters" 
      def monsters
        MonsterFacade.monster_list
      end

    field :monster, Types::MonsterType, null: false,
      description: "Details for one monster" do
        argument :index, String
      end
      def monster(index:)
        MonsterFacade.single_monster_details(index)
      end

    field :encounters, [Types::EncounterType], null: false,
      description: "A complete list of a users encounters" do
        argument :userId, String, required: true 
      end
      def encounters(userId:)
        Encounter.where(user_id: userId)
      end

    field :encounter, Types::EncounterType, null: false,
      description: "Details for one encounter" do
        argument :id, ID, required: true
      end
    def encounter(id:)
      Encounter.find_by(id: id)
    end
  end
end

class DndService
  def dnd_client
    # NOTE we can also include another argument here for http_options:  read_timeout: # }
    # To error if it takes too long for a response to get back from dnd graphql
    Graphlient::Client.new(
      'https://www.dnd5eapi.co/graphql',
      headers: { 'Content-Type' => 'application/json' }
    )
  end
  
  def query_monster_list
    response = dnd_client.query <<~GRAPHQL
      query {
        monsters {
          index
          name
          challenge_rating
          size
          type
          alignment
        }
      }
    GRAPHQL
  end

  def query_monster_details(index)
    query = dnd_client.parse <<~GRAPHQL
      query($index: String) {
        monster(index: $index) {
          index
          name
          size
          armor_class {
            value
          }
          speed {
            walk
            fly
            swim
          }
          hit_points
          strength
          dexterity
          constitution
          intelligence
          wisdom
          charisma
          damage_vulnerabilities
          damage_resistances
          damage_immunities
          proficiency_bonus
          proficiencies {
              proficiency {
                  name
              }
              value
          }
          senses {
              blindsight
              darkvision
              passive_perception
          }
          special_abilities {
            name
            desc
          }
          actions {
            name
            desc
          }
          legendary_actions {
            name
            desc
          }
          condition_immunities {
            name
          }
        }
      }
    GRAPHQL

    response = dnd_client.execute(query, index: index)
  end
end

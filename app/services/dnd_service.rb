class DndService
  def dnd_client
    # NOTE we can also include another argument here for http_options:  read_timeout: # }
    # To error if it takes too long for a response to get back from dnd graphql
    Graphlient::Client.new(
      'https://www.dnd5eapi.co/graphql',
      headers: { 'Content-Type' => 'application/json' }
    )
  end
  
  def query_monster_names
    response = dnd_client.query <<~GRAPHQL
      query {
        monsters {
          index
          name
        }
      }
    GRAPHQL
  end

  def query_monster_details(index)
    variables = { index: index }
    response = dnd_client.query <<~GRAPHQL
      query($index: String) {
        monster(index: $index) {
          index
          name
          image
          size
          type
          alignment
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
          languages
          special_abilities {
            desc
          }
          actions {
            desc
          }
          legendary_actions {
            desc
          }
        }
      }
    GRAPHQL
  end
end

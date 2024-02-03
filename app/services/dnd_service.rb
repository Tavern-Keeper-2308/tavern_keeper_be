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
end

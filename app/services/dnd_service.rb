class DndService
  def conn
    Faraday.new(url: "https://www.dnd5eapi.co/graphql")
  end

  def query_monsters
    graphql_query = 

    response = conn.post do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = {query: graphql_query }.to_json
    end

    data = JSON.parse(response.body, symbolize_names: :true)
  end

  def query_monster(index)

  end
end
class DndService
  # def conn
  #   Faraday.new(url: "https://www.dnd5eapi.co/graphql")
  # end

  # def query_monsters
  #   graphql_query = <<~GRAPHQL
  #     query Monsters {
  #       monsters {
  #         name
  #         index
  #       }
  #     }
  #   GRAPHQL

  #   response = conn.post do |request|
  #     request.headers['Content-Type'] = 'application/graphql'
  #     request.body = { query: graphql_query }.to_json
  #   end

  #   data = JSON.parse(response.body, symbolize_names: :true)
  # end

  def query_monsters
    query = <<~GRAPHQL
      query Monsters {
        monsters {
          name
          index
        }
      }
    GRAPHQL

    response = HTTParty.post(
      "https://www.dnd5eapi.co/graphql",
      headers:{ 'content-type' => 'application/graphql' },
      body: query
    )
    require 'pry'; binding.pry
    data = JSON.parse(response.body, symbolize_names: :true)
    # require 'pry'; binding.pry
  end
  # def query_monster(index)

  # end
end
class DndService
  def conn
    Faraday.new(url: "https://www.dnd5eapi.co/graphql")
  end


  def query_monsters
    graphql_query = <<~GRAPHQL
      {
        monsters {
          name
          index
        }
      }
    GRAPHQL

    response = conn.post do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = { query: graphql_query }.to_json
    end

    data = JSON.parse(response.body, symbolize_names: true)
  end

  # def query_monsters
  #   query = <<~GRAPHQL
  #     query Monsters {
  #       monsters {
  #         name
  #         index
  #       }
  #     }
  #   GRAPHQL

  #   response = HTTParty.post(
  #     "https://www.dnd5eapi.co/graphql",
  #     headers:{ 'content-type' => 'application/json' },
  #     body: query.to_json
  #   )
  #   data = JSON.parse(response.body, symbolize_names: :true)
  #   # require 'pry'; binding.pry

  # end

  # class << self
  #   attr_accessor :base_site, :base_headers

  #   def base_headers
  #     @base_headers ||= {
  #         'Content-Type' => 'application/json',
  #         'Accept' => 'application/json'
  #     }
  #   end
  # end

  # attr_accessor :site, :headers, :body, :response

  # def initialize(**args)
  #   @site = "https://www.dnd5eapi.co/graphql" || args[:site] || base_site
  #   headers.merge!(args[:headers].to_h)
  #   self
  #       @my_query = <<~GRAPHQL
  #     query Monsters {
  #       monsters {
  #         name
  #         index
  #       }
  #     }
  #   GRAPHQL
  # end

  # def query_monsters(**args)
  #   self.body = {}
  #   body["query"] = @my_query || raise(ArgumentError 'Missing query string.')
  #   # body["variables"] = args[:variables]
  #   # body["operationName"] = args[:operation_name]

  #   self.response = post
  #   require 'pry'; binding.pry
  # end

  # def headers
  #   @headers ||= base_headers.to_h
  # end

  # private

  # def base_site
  #   self.class.base_site
  # end

  # def base_headers
  #   self.class.base_headers
  # end

  # def faraday_module
  #   Faraday
  # end

  # def json_parser
  #   JSON
  # end

  # def new_faraday_connection
  #   faraday_module.new
  # end

  # def body_json
  #   json_parser.generate(body)
  # end

  # def post
  #   new_faraday_connection.post do |req|
  #     req.url site
  #     req.headers.merge! headers
  #     req.body = body_json
  #   end
  # end

end
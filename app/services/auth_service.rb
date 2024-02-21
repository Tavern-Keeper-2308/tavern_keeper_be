class AuthService
  def self.conn
    Faraday.new(url: 'http://[::1]:4000')
  end

  def self.check_token(token)
    response = conn.get("/users/tokens/info") do |req|
     req.headers['Authorization'] = "#{token}"
     req.headers['Content-Type'] = "application/json"
   end
    # JSON.parse(response.body, symbolize_names: true)
  end

  # def self.token_actions(url, token)
  #   response = conn.post("/users/tokens/#{url}") do |req|
  #     req.headers['Authorization'] = "Bearer #{token}"
  #     req.headers['Content-Type'] = "application/json"
  #   end
  #    JSON.parse(response.body, symbolize_names: true)
  # end
end
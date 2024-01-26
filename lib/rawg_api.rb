require 'rest-client'
require 'json'

module Rawg
  module Request
    BASE_URL = "https://api.rawg.io/api"
    API_KEY = '834402d5c30148dfa749cbf4eaba01ed'

    def self.call(http_method:, endpoint:, params: {})
      url = "#{BASE_URL}#{endpoint}?key=#{API_KEY}"

      case http_method.upcase
      when "GET"
        response = RestClient.get(url, params: params)
      else
        raise ArgumentError, "Unsupported HTTP method: #{http_method}"
      end

      handle_response(response)
    end

    def self.handle_response(response)
      if response.code == 200
        JSON.parse(response.body)
      else
        puts "Failed to make API request. Status code: #{response.code}"
        puts "Response body: #{response.body}"
        nil
      end
    end
  end

  class Client
    def self.creator_roles
      Request.call(http_method: "GET", endpoint: "/creator-roles")
    end

    def self.games
      Request.call(http_method: "GET", endpoint: "/games")
    end

    def self.creators
      Request.call(http_method: "GET", endpoint: "/creators")
    end

    def self.genres
      Request.call(http_method: "GET", endpoint: "/genres")
    end

    def self.games_dlc_additions(game_pk)
      Request.call(http_method: "GET", endpoint: "/games/#{game_pk}/additions")
    end
  end
end

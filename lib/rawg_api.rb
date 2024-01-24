require 'rest-client'
require 'json'

module Rawg
  module Request
    BASE_URL = "https://api.rawg.io/api".freeze
    API_KEY = '834402d5c30148dfa749cbf4eaba01ed'.freeze

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
    def self.games
      Request.call(http_method: "GET", endpoint: "/games")
    end
  end
end

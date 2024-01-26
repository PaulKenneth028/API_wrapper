# README
### My steps on creating this API wrapper.

Created and placed rawg_api.rb at library 'app/lib' since it is reusable

Passed the api folder to 'config/initializer' to construct an absolute path to a file or directory within a Rails application. This is also to ensure it gets loaded when the Rails application starts.

"require Rails.root.join('lib/rawg_api)"

The client and request class is located in one file to organize the code

inside the rawg_api.rb The handle_response method provides a basic way to handle API responses, especially focusing on logging information when the response code is not 200. Depending on application's needs.
```ruby
"def self.handle_response(response)
      if response.code == 200
        JSON.parse(response.body)
      else
        puts "Failed to make API request. Status code: #{response.code}"
        puts "Response body: #{response.body}"
        nil
      end
    end
end"
```
Created a controller that handles the request it defines an index action that invoked when a request is made to the
routes created which is 

```ruby
'Rails.application.routes.draw do
  get '/games', to: 'games#index'
end'
```

ENDPOINTS:

HTTP METHOD: GET
##### https://api.rawg.io/api/genres
##### https://api.rawg.io/api/games
##### https://api.rawg.io/api/creators
##### https://api.rawg.io/api/creator-roles


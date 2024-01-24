module Rawg
    class Client
        def self.creator_roles
            response = Request.call(http_method: "GET", endpoint: "/creator_roles")
        end
    end
end
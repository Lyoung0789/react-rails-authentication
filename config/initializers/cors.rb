Rails.application.config.middleware.insert_before 0, Rack::Cors do 
    allow do 
        origins "http://localhost:3000"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end 

    # this will be on heroku see video 1 for explanation. before 12 min 
    # allow do 
    #     origin "http://localhost:3000"
    #     resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    # end 
end

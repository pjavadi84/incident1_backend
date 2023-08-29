Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  # adjust this if you know the exact domain, otherwise '*' stands for any origin
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :patch, :put, :delete, :options, :head],
        credentials: false
    end
  end
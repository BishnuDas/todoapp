class HomeController < ActionController::Base
    def index
    end

    def todo
        # Render the todo view
        # You can add instance variables here to pass data to the view
        # @todos = Todo.all
    end

    def quix
        # Render the todo view
        # You can add instance variables here to pass data to the view
        # @todos = Todo.all
    end

    def gst_index
        prices = fetch_metal_prices_from_api
        @gold_price = prices[:gold] || 200
        @silver_price = prices[:silver] || 100
    end

    private
    
    # Option 1: Using Metals.Live API (Free tier available)
    def fetch_metal_prices_from_api
        response = HTTParty.get(
            'https://api.metals.live/v1/spot/gold,silver',
            headers: { 'Accept' => 'application/json' }
        )
        data = JSON.parse(response.body)
        {
            gold: data[0]['price'].to_f.round(2),
            silver: data[1]['price'].to_f.round(2)
        }
    rescue => e
        Rails.logger.error("API Error: #{e.message}")
        # Add this return statement:
        { gold: nil, silver: nil }  # Returns nil so fallback works
    end
end
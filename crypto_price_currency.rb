require 'httparty'
require 'json'

def fetch_crypto_data
    response = HTTParty.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')
    response.parsed_response
  end

def sort_data(data)
  sorted_data = data.sort_by { |coin| -coin['market_cap'] }
  sorted_data.first(5)
end

def print_data(data)
  data.each do |coin|
    puts "Name: #{coin['name']}, Current Price: $#{coin['current_price']}, Market Cap: $#{coin['market_cap']}"
  end
end

data = fetch_crypto_data
sorted_data = sort_data(data)
print_data(sorted_data)

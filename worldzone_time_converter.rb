require 'httparty'
require 'json'

def get_time_for_timezone(area, location)
    response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")
    response.parsed_response
  end

puts "Enter the area (e.g., Europe):"
area = gets.chomp
puts "Enter the location (e.g., London):"
location = gets.chomp

time_data = get_time_for_timezone(area, location)

current_time = time_data['datetime']
formatted_time = DateTime.parse(current_time).strftime("%Y-%m-%d %H:%M:%S")

puts "The current time in #{area}/#{location} is #{formatted_time}"

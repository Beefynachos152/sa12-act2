require 'httparty'

def fetch_repo_data(username)
  response = HTTParty.get("https://api.github.com/users/#{username}/repos")
  
  if response.code == 200
    response.parsed_response
  else
    puts "Error: User not found or API request failed."
    []
  end
end

puts "Enter the GitHub username:"
username = gets.chomp

repo_data = fetch_repo_data(username)

if repo_data.any? 
  most_starred_repo = repo_data.max_by { |repo| repo['stargazers_count'] }

  puts "Most Starred Repository:"
  puts "Name: #{most_starred_repo['name']}"
  puts "Description: #{most_starred_repo['description']}" 
  puts "Stars: #{most_starred_repo['stargazers_count']}"
  puts "URL: #{most_starred_repo['html_url']}"
else
end

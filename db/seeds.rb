require 'open-uri'

user = User.first

url = "https://graph.facebook.com/v2.1/me/home?limit=200&access_token=#{user.facebook_access_token}"

raw_data = open(url).read
parsed_data = JSON.parse(raw_data)
posts = parsed_data["data"]

puts posts.to_yaml

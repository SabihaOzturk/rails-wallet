require 'net/http' 
require 'json'
require 'pry'


def dribbble_api_response   

# encode URI using the URI constant   
uri = URI("http://api.dribbble.com/shots/everyone")   

# tell Net::HTTP to GET the URI  
response = Net::HTTP.get(uri) # => String 
parsed_response = JSON.parse(response)

our_data = parsed_response["shots"].map do |shot|
  { image_url: shot["image_url"],
    likes_count: shot["likes_count"]}
  end

binding.pry
end


# Jeremy's file:
# require 'net/http'
# require 'json'
# require 'pry'

# def dribbble_api_response

#   results = []

#   (1..8).each do |page|

#     # encode URI using the URI constant
#     uri = URI("http://api.dribbble.com/shots/everyone?page=#{page}&per_page=100")

#     response = Net::HTTP.get(uri)
#     parsed_response = JSON.parse(response)

#     our_data = parsed_response["shots"].map do |shot|
#       { image_url: shot["image_url"],
#         likes_count: shot["likes_count"] }
#     end

#     results << our_data
#   end

#   results.flatten!

#   File.open("./custom_dribbble.json", "w") do |f|
#     f.puts results
#   end

# end

# dribbble_api_response
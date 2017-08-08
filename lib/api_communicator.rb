require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  array_of_film_urls = nil
  character_hash["results"].each do |element|
    if element["name"] == character
      array_of_film_urls = element["films"]
    end




    array_of_film_urls.collect do |film_url|
     film_info = RestClient.get(film_url)
     films_hash = JSON.parse(films_hash)
   end

end



def parse_character_movies(film_hashes)
film_hashes.each do |hash|
  puts hash["title"]
end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

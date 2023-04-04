# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

puts "Cleaning up database..."
Bookmark.destroy_all
Movie.destroy_all

puts "Database cleaned"

url = "https://tmdb.lewagon.com/movie/top_rated"

puts "Importing movies from page 1"

movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
results = movies["results"]

results.each do |result|
  puts "Creating #{result['title']}"
  base_poster_url = "https://image.tmdb.org/t/p/w500/"
  Movie.create(
    title: result['title'],
    overview: result['overview'],
    poster_url: "#{base_poster_url}#{result['poster_path']}",
    rating: result['vote_average']
  )
end

puts "Movies created"

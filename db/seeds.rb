
require 'net/http'
require 'json'

puts "Cleaning database..."

List.destroy_all
Movie.destroy_all
Bookmark.destroy_all

puts "Creating lists..."
lists = [
  List.create!(name: "Sci-Fi Classics"),
  List.create!(name: "Drama"),
  List.create!(name: "Action"),
  List.create!(name: "Comedy"),
  List.create!(name: "Romance")
]


puts "Fetching movies..."
url = URI('https://tmdb.lewagon.com/movie/top_rated')

response = Net::HTTP.get(url)          # GET request
data = JSON.parse(response)


puts "Creating movies..."
 movies = data["results"].map do |film|
  Movie.create!(
    title: film['title'],
    overview: film['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{film['poster_path']}",
    rating: film['vote_average']
  )
end

puts "Creating bookmarks..."
movies.each do |movie|
  # On choisit UNE liste au hasard
  list = lists.sample

  Bookmark.create!(
    comment: Faker::Movie.quote,
    movie: movie,
    list: list
  )
end

require ("sinatra")
require ("sinatra/reloader")
also_reload ("lib/**/*.rb")
require ('./lib/dictionary.rb')
require ('pry')


get ("/") do
  dictionary = Dictionary.new()
  erb :index
end

get ("/dictionary") do
  @all_words = Dictionary.get_all_words
  erb :dictionary
end

post ("/dictionary") do
  @all_words = Dictionary.get_all_words
  erb :dictionary
end

post ("/dictionary/add_word") do
  @test = "add word"
  erb :add_word
end

post ("/test") do
binding.pry
end

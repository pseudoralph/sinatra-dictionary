require ("sinatra")
require ("sinatra/reloader")
also_reload ("lib/**/*.rb")
require (./lib/dictionary.rb)

get ("/") do
  erb :index
end

get ("/dictionary") do
  @test = "default view"
  erb :dictionary
end

post ("/dictionary") do
  @test = "view dictionary"
  erb :dictionary
end

post ("/dictionary/add_word") do
  @test = "add word"
  erb :dictionary
end

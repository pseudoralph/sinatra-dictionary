require ("sinatra")
require ("sinatra/reloader")
also_reload ("lib/**/*.rb")
require ('./lib/dictionary.rb')

get ("/") do
  dictionary = Dictionary.new()
  erb :index
end

get ("/dictionary") do
  @all_words = Dictionary.get_all_words
  erb :dictionary
end

get ("/definition/:word_id") do
  @definition = Dictionary.get_word(params[:word_id])
  erb :definition
end

get ("/definition/:word_id/add_definition") do
  @definition = Dictionary.get_word(params[:word_id])
  erb :add_definition
end

post ("/definition/:word_id/add_definition") do
  Dictionary.append_definition(params[:word_id],params[:definition])
  @definition = Dictionary.get_word(params[:word_id])
  erb :definition
end

get ("/dictionary/add_word") do
  erb :add_word
end

post ("/dictionary/add_word") do
  Dictionary.add_new_word({word: params[:word], definition: params[:definition]})
  redirect ("/dictionary")
end

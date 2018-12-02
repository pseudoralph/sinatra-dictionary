require ("sinatra")
require ("sinatra/reloader")
also_reload ("lib/**/*.rb")
require_relative ('lib/dictionary.rb')
require 'pry'

get ("/") do
  erb :index
end

get ("/console") do
  erb :console
end

get ("/console/:flag") do
  if params[:flag] == "reset"
    Dictionary.reset
  elsif params[:flag] == "load_empty"
    Dictionary.load
  elsif params[:flag] == "load_with_defs"
    Dictionary.load(true)
  end

  redirect ("/dictionary")
end


get ("/dictionary") do
  dictionary = Dictionary.new()
  @all_words = dictionary.get_all_words
  erb :dictionary
end

get ("/definition/:word_id") do
  dictionary = Dictionary.new()
  @definition = dictionary.get_word(params[:word_id])
  erb :definition
end

get ("/definition/:word_id/add_definition") do
  dictionary = Dictionary.new()
  @definition = dictionary.get_word(params[:word_id])
  erb :add_definition
end

post ("/definition/:word_id/add_definition") do
  dictionary = Dictionary.new()
  dictionary.append_definition(params[:word_id],params[:definition])
  @definition = dictionary.get_word(params[:word_id])
  erb :definition
end

get ("/dictionary/add_word") do
  erb :add_word
end

post ("/dictionary/add_word") do
  dictionary = Dictionary.new()
  dictionary.add_new_word({word: params[:word], definition: params[:definition]})
  redirect ("/dictionary")
end

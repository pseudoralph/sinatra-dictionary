require "dictionary"
require 'rspec'

describe ("word") do
  it ("retreives all definitions of a word") do
    val = {word: 'hello', definition: 'a kind greeting'}
    word = Word.new(val)
    word.add_definition('a recurring character from Arrested Development')

    expect(word.definitions).to eq(['a kind greeting','a recurring character from Arrested Development'])
  end

end

describe ("dictionary") do
  it ("create new empty dictionary") do
    dict = Dictionary.new(false)

    expect(Dictionary.get_all_words).to eq([])
  end

  # it ("create a dictionary with default words") do
  #   dict = Dictionary.new()
  #
  #   expect(Dictionary.get_all_words).to eq(["word1","word2","word3"])
  # end

end

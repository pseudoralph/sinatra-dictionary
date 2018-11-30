require "dictionary"
require 'rspec'

describe ("word") do
  it ("create a word and retreive its") do
    val = {word: 'hello', definition: 'a kind greeting'}
    word = Word.new(val)

    expect(word.definitions).to eq(['a kind greeting'])
  end

  it ("add additional definition to word") do
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

  it ("create new dictionary with pre-loaded words and definitions") do
    dict = Dictionary.new()
    (Dictionary.get_all_words).should have(2).items
  end


end

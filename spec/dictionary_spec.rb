require 'dictionary'
require 'rspec'

describe ("word") do
  it ("create a word and retreive its") do
    val = {word: 'hello'}
    word = Word.new(val)

    expect(word.word).to eq('hello')
  end

  it ("add definition to word") do
    val = {word: 'hello'}
    word = Word.new(val)
    word.add_definition('an intorductory greeting')

    expect(word.definitions).to eq(['an intorductory greeting'])
  end

end

describe ("dictionary") do
  before(:each) do
    Dictionary.reset
  end

  it ("#new: creates new empty dictionary") do
    dict = Dictionary.new()
    expect(dict.get_all_words.length).to eq(0)
  end

  it ("#load: loads difficult words (25 in hash)") do
    Dictionary.load()
    dict = Dictionary.new()
    expect(dict.get_all_words.length).to eq(25)
  end

  it ("#add_new_word & #get_all_words: add a word to dictionary and retreive") do
    dict = Dictionary.new()
    dict.add_new_word({word: 'hi'})

    expect(dict.get_all_words[0].word).to eq('hi')
  end

  it ("#append_definition: add definition to existing word- requires unique word_id") do
    dict = Dictionary.new()
    dict.add_new_word({word: 'hi'})
    word_id = dict.get_all_words[0].word_id
    dict.append_definition(word_id, 'an intorductory greeting')

    expect(dict.get_all_words[0].definitions).to eq(['an intorductory greeting'])
  end

  it ("#get_word: retreives a single word object from dictionary- requires unique word_id") do
    dict = Dictionary.new()
    dict.add_new_word({word: 'hi'})
    word_id = dict.get_all_words[0].word_id
    dict.append_definition(word_id, 'an intorductory greeting')

    expect(dict.get_word(word_id).word).to eq('hi')
    expect(dict.get_word(word_id).definitions).to eq(['an intorductory greeting'])

  end


end

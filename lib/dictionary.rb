require_relative 'word'
require 'pry'

class Dictionary
  @@db_dictionary = []

  def initialize(standard_dictionary=true)
    if standard_dictionary
      defaults = []

      defaults.push(Word.new({word: 'hello', definition: 'a kind greeting'}))
      defaults.push(Word.new({word: 'goodbye', definition: 'opposite of hello'}))

      @@db_dictionary = defaults
    end

  end

  def self.get_all_words
    @@db_dictionary
  end


  def self.get_word(word_id)
    @@db_dictionary.each do |word|
      if word.word_id == word_id
        return word
      end
    end
  end

  def self.add_new_word(attributes)
    @@db_dictionary.push(Word.new(attributes))
  end

end

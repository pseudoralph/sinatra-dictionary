require_relative 'word'
require_relative 'default_dict'

class Dictionary
  @@db_dictionary = []

  def initialize(standard_dictionary=true)
    if standard_dictionary
      defaults = []

      defaults.push(Word.new({word: 'Hello', definition: 'A kind greeting'}))
      defaults.push(Word.new({word: 'Goodbye', definition: 'The opposite of hello— typically said when a person leaves'}))

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

  def self.append_definition(word_id,definition)
    @@db_dictionary.each do |word|
      if word.word_id == word_id
        word.add_definition(definition)
      end
    end
  end

end

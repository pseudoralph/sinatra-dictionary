require_relative 'word'
require_relative 'default_dict'

class Dictionary
  @@db_dictionary = []

  def self.reset
    @@db_dictionary = []
  end

  def self.load(with_defs=false)
    db = []
    DefaultDict::HARDWORDS.each do |key|
      word = Word.new({word: key[:word]})
      if with_defs
        word.add_definition(key[:definition])
      end
      db.push(word)
    end
    @@db_dictionary = db
  end

  def get_all_words
    @@db_dictionary
  end

  def get_word(word_id)
    @@db_dictionary.each do |word|
      if word.word_id == word_id
        return word
      end
    end
  end

  def add_new_word(attributes)
    @@db_dictionary.push(Word.new(attributes))
  end

  def append_definition(word_id,definition)
    @@db_dictionary.each do |word|
      if word.word_id == word_id
        word.add_definition(definition)
      end
    end
  end

end

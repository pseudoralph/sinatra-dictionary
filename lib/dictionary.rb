require_relative 'word'
require_relative 'default_dict'

class Dictionary
  @@db_dictionary = []

  def self.reset
    @@db_dictionary = []
  end

  def self.load_hard(db=false)
    default = []
    DefaultDict::HARDWORDS.each do |key|
      default.push(Word.new({word: key[:word]}))
    end
    @@db_dictionary = default

    if db
      @@db_dictionary.each do |word|
        DefaultDict::HARDWORDS.each do |key|
          if key[:word] == word.word
            word.add_definition(key[:definition])
          end
        end
      end
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

require 'new_word'

class Dictionary
  @@db_dictionary = []

  def initialize(load_defaults=true)
    if load_defaults
      # starter dictionary gets loaded here
      @@db_dictionary.push("word1")
      @@db_dictionary.push("word2")
      @@db_dictionary.push("word3")
    end

  end

  def self.get_all_words
    @@db_dictionary
  end

end

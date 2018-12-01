require 'securerandom'

class Word
  attr_reader :word, :word_id, :definitions

  def initialize(attributes)
    @word_id = SecureRandom.alphanumeric(6)
    @word = attributes[:word]
    @definitions = []
  end

  def add_definition(definition)
    @definitions.push(definition)
  end

end

require 'securerandom'

class Word
  attr_reader :word, :word_id, :definitions

  def initialize(attributes)
    @word_id = SecureRandom.alphanumeric(6) #only avail in Ruby > 2.4.5
    # @word_id = SecureRandom.hex(4) #fall back method
    @word = attributes[:word]
    @definitions = []
  end

  def add_definition(definition)
    @definitions.push(definition)
  end

end

require 'pry'
require 'pry-nav'
class PatternGenerator
  attr_reader :character_array, :permutations_array, :second_string_array
  def initialize
    @character_array = []
    @number_array =[]
    initialize_array
    @permutations_array = []
    @first_string_array = []
    @second_string_array = []
  end

  def initialize_array
    ('A'..'Z').each do |character|
      @character_array.push(character)
    end

    (0..9).each do |number|
      @character_array.push(number)
    end
  end

end




pg = PatternGenerator.new

pg.character_array

pg.get_second_string

print pg.new_permutations_array.length

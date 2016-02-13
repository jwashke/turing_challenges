class Person
  attr_reader :name
  attr_accessor :cash, :accounts

  def initialize(name, cash=0)
    @name = name
    @cash = cash
    @accounts = {}
    person_creation_output
  end

  private

  def person_creation_output
    puts "#{name} has been created with #{cash} galleons in cash"
  end
end

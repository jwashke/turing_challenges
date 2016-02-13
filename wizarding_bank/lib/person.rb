class Person
  attr_reader :name, :cash, :bank_accounts

  def initialize(name, cash=0)
    @name = name
    @cash = cash
    @bank_accounts = {}
    person_creation_output
  end

  def person_creation_output
    puts "#{name} has been created with #{cash} galleons in cash"
  end
end

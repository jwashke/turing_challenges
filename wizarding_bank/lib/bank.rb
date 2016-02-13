class Bank
  attr_reader :name, :current_cash
  def initialize(name)
    @name = name
    @current_cash = 0
    creation_message
  end

  def open_account(person)
    person.accounts["#{name}"] = 0
    "An account has been opened for #{person.name} with #{@name}."
  end

  def deposit(person, amount)
    if person.cash >= amount
      make_deposit(person, amount)
    else
      "#{person.name} does not have enough cash to perform this deposit"
    end
  end

  private

  def creation_message
    "#{name} has been created"
  end

  def make_deposit(person, amount)
    person.cash -= amount
    person.accounts["#{name}"] += amount
    @current_cash += amount
    "#{amount} galleons have been deposited into #{person.name}'s #{@name} account. Balance: #{person.accounts["#{@name}"]} Cash: #{person.cash}"
  end

end

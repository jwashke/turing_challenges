require 'pry'
class Bank
  attr_reader :name
  attr_accessor :current_cash

  def initialize(name)
    @name = name
    @current_cash = 0
    message
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

  def withdrawal(person, amount)
    if person.accounts["#{@name}"] >= amount
      make_withdrawal(person, amount)
    else
      "Insufficient funds."
    end
  end

  def transfer(person, bank, amount)
    if person.accounts.has_key?("#{bank.name}") and person.accounts["#{name}"] >= amount
      make_transfer(person, bank, amount)
    elsif person.accounts.has_key?("#{bank.name}")
      "Insufficient funds."
    else
      "#{person.name} does not have an account with #{bank.name}"
    end
  end

  private

  def message
    "#{@name} has been created"
  end

  def make_deposit(person, amount)
    person.cash -= amount
    person.accounts["#{name}"] += amount
    @current_cash += amount
    "#{amount} galleons have been deposited into #{person.name}'s #{@name} account. Balance: #{person.accounts["#{@name}"]} Cash: #{person.cash}"
  end

  def make_withdrawal(person, amount)
    decrease_bank_cash(person, amount)
    person.cash += amount
    "#{person.name} has withdrawn #{amount} galleons. Balance: #{person.accounts["#{@name}"]}"
  end

  def make_transfer(person, bank, amount)
    person.accounts["#{bank.name}"] +=  amount
    decrease_bank_cash(person, amount)
    bank.current_cash += amount
    "#{person.name} has transferred #{amount} galleons from #{@name} to #{bank.name}"
  end

  def decrease_bank_cash(person, amount)
    person.accounts["#{@name}"] -= amount
    @current_cash -= amount
  end
end

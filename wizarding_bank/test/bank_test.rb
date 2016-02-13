gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/bank'
require_relative '../lib/person'

class BankTest < Minitest::Test

  def test_a_bank_can_be_created
    wells_fargo = Bank.new("Wells Fargo")
    assert_equal Bank, wells_fargo.class
  end

  def test_bank_can_have_a_name
    wells_fargo = Bank.new("Wells Fargo")
    assert_equal "Wells Fargo", wells_fargo.name
  end

  def test_bank_has_a_current_total_cash
    wells_fargo = Bank.new("Wells Fargo")
    assert_equal 0, wells_fargo.current_cash
  end

  def test_bank_outputs_a_string_when_created
    string = "Wells Fargo has been created"
    assert_equal, string, wells_fargo = Bank.new("Wells Fargo")
  end

  def test_bank_can_create_an_account_on_a_person
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    assert_equal ({"Wells Fargo" => 0}), person.accounts
  end

  def test_bank_returns_a_string_when_an_account_is_opened
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    string = "An account has been opened for Josh with Wells Fargo."
    assert_equal string, wells_fargo.open_account(person)
  end

  def test_person_should_be_able_to_deposit_money_at_their_bank_increasing_their_balance
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 750)
    assert_equal 750, person.accounts["Wells Fargo"]
  end

  def test_person_depositing_money_decreases_their_cash_by_that_amount
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 750)
    assert_equal 250, person.cash
  end

  def test_depositing_money_increases_the_banks_current_cash
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 750)
    assert_equal 750, wells_fargo.current_cash
  end

  def test_it_returns_a_string_when_person_makes_a_deposit
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    string = "750 galleons have been deposited into Josh's Wells Fargo account. Balance: 750 Cash: 250"
    assert_equal string, wells_fargo.deposit(person, 750)
  end

  def test_person_cannot_deposit_more_than_their_current_cash_amount
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 1500)
    assert_equal 1000, person.cash
    assert_equal 0, person.accounts["Wells Fargo"]
    assert_equal 0, wells_fargo.current_cash
  end

  def test_it_returns_a_string_when_person_does_not_have_enough_cash_for_a_deposit
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    string = "Josh does not have enough cash to perform this deposit"
    assert_equal string, wells_fargo.deposit(person, 1500)
  end

  def test_person_can_withdrawal_cash_from_a_bank_and_increase_their_current_cash
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 750)
    wells_fargo.withdrawal(person, 250)
    assert_equal 500, person.cash
  end

  def test_withdrawals_decrease_account_balance_by_withdrawal_amount
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 750)
    wells_fargo.withdrawal(person, 250)
    assert_equal 500, person.accounts["Wells Fargo"]
  end

  def test_withdrawals_decrease_the_banks_current_cash
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 750)
    wells_fargo.withdrawal(person, 250)
    assert_equal 500, wells_fargo.current_cash
  end

  def test_withdrawing_money_from_the_bank_returns_a_string
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 750)
    string = "Josh has withdrawn 250 galleons. Balance: 500"
    assert_equal string, wells_fargo.withdrawal(person, 250)
  end

  def test_person_cannot_withdrawal_more_than_they_have_in_the_bank
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 750)
    wells_fargo.withdrawal(person, 1000)
    assert_equal 250, person.cash
    assert_equal 750, person.accounts["Wells Fargo"]
    assert_equal 750, wells_fargo.current_cash
  end

  def test_it_returns_a_string_when_someone_tries_to_overdraft
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 750)
    assert_equal "Insufficient funds.", wells_fargo.withdrawal(person, 1000)
  end

  def test_bank_can_transfer_money_to_another_bank_increasing_funds_at_second_bank
    skip
    wells_fargo = Bank.new("Wells Fargo")
    chase = Bank.new("JP Morgan Chase")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    chase.open_account(person)
    wells_fargo.deposit(person, 750)
    wells_fargo.transfer(person, chase, 250)
    assert_equal 250, person.accounts["JP Morgan Chase"]
  end

  def test_bank_transfer_decreases_money_at_bank_transfering_money
    skip
    wells_fargo = Bank.new("Wells Fargo")
    chase = Bank.new("JP Morgan Chase")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    chase.open_account(person)
    wells_fargo.deposit(person, 750)
    wells_fargo.transfer(person, chase, 250)
    assert_equal 500, person.accounts["Wells Fargo"]
  end

  def test_bank_transfer_increases_cash_in_bank_being_transferred_to
    skip
    wells_fargo = Bank.new("Wells Fargo")
    chase = Bank.new("JP Morgan Chase")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    chase.open_account(person)
    wells_fargo.deposit(person, 750)
    wells_fargo.transfer(person, chase, 250)
    assert_equal 250, chase.current_cash
  end

  def test_bank_transfer_decreases_cash_at_transferring_bank
    skip
    wells_fargo = Bank.new("Wells Fargo")
    chase = Bank.new("JP Morgan Chase")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    chase.open_account(person)
    wells_fargo.deposit(person, 750)
    wells_fargo.transfer(person, chase, 250)
    assert_equal 500, wells_fargo.current_cash
  end

  def test_bank_transfer_returns_a_string_when_successful
    skip
    wells_fargo = Bank.new("Wells Fargo")
    chase = Bank.new("JP Morgan Chase")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    chase.open_account(person)
    wells_fargo.deposit(person, 750)
    string = "Josh has transferred 250 galleons from Wells Fargo to JP Morgan Chase"
    assert_equal string, wells_fargo.transfer(person, chase, 250)
  end

  def test_a_person_cannot_transfer_more_money_than_they_have_in_the_bank
    skip
    wells_fargo = Bank.new("Wells Fargo")
    chase = Bank.new("JP Morgan Chase")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    chase.open_account(person)
    wells_fargo.deposit(person, 750)
    wells_fargo.transfer(person, chase, 1000)
    assert_equal 750, person.accounts["Wells Fargo"]
    assert_equal 0, person.accounts["JP Morgan Chase"]
    assert_equal 750, wells_fargo.current_cash
    assert_equal 0, chase.current_cash
  end

  def test_unsuccesful_transfer_returns_a_string
    skip
    wells_fargo = Bank.new("Wells Fargo")
    chase = Bank.new("JP Morgan Chase")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    chase.open_account(person)
    wells_fargo.deposit(person, 750)
    string = "Insufficient Funds"
    assert_equal string, wells_fargo.transfer(person, chase, 1000)
  end

  def test_person_cannot_transfer_money_to_a_bank_he_doesnt_have_an_account_with
    skip
    wells_fargo = Bank.new("Wells Fargo")
    chase = Bank.new("JP Morgan Chase")
    person = Person.new("Josh", 1000)
    wells_fargo.open_account(person)
    wells_fargo.deposit(person, 750)
    string = "Josh does not have an account with JP Morgan Chase"
    assert_equal string, wells_fargo.transfer(person, chase, 250)
    assert_equal 0, chase.current_cash
    assert_equal 750, wells_fargo.current_cash
    assert_equal 750, person.accounts["Wells Fargo"]
  end
end

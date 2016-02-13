gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/person'

class PersonTest < Minitest::Test

  def test_you_can_instantiate_a_person
    person = Person.new("Josh")
    assert_equal Person, person.class
  end

  def test_has_a_name
    person = Person.new("Josh")
    assert_equal "Josh", person.name
  end

  def test_has_money
    person = Person.new("Josh", 1000)
    assert_equal 1000, person.cash
  end

  def test_defaults_to_zero_cash_on_hand
    person = Person.new("Josh")
    assert_equal 0, person.cash
  end

  def test_has_a_hash_of_bank_accounts_and_balances
    person = Person.new("Josh")
    assert_equal ({}), person.accounts
  end

  def test_creating_a_person_returns_a_string
    string = "Josh has been created with 0 galleons in cash\n"
    assert_equal string, person = Person.new("Josh")
  end
end

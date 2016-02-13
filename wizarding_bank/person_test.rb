gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class PersonTest < Minitest::Test

  def test_you_can_instantiate_a_person
    person = Person.new("Jenny")
    assert_equal Person, person1.class
  end

  def test_has_a_name
    person = Person.new("Jenny")
    assert_equal "Jenny", person.name
  end

  def test_has_money
    person = Person.new("Jenny", 1000)
    assert_equal 1000, person.cash_on_hand
  end

  def test_defaults_to_zero_cash_on_hand
    person = Person.new("Jenny")
    assert_equal 0, person.cash_on_hand
  end

  def test_has_a_hash_of_bank_accounts_and_balances
    person = Person.new("Jenny")
    assert_equal {}, person.bank_account
  end
end

require 'byebug'

class Sieve
  private

  def initialize(upto)
    @upto = upto
    @border = upto**(1.0 / 2)
    init_numbers
  end

  def init_numbers
    @numbers = {}
    2.upto(@upto) { |key| @numbers[key] = false }
  end

  def sieve
    2.upto(@border) do |number|
      sieve_helper(number)
    end
  end

  def sieve_helper(number)
    return nil if @numbers[number]

    (number * number).step(@upto, number) { |value| @numbers[value] = true }
  end

  def primes_array
    @numbers.map do |key, value|
      key if value == false
    end.compact
  end

  public

  def primes
    sieve
    primes_array
  end
end

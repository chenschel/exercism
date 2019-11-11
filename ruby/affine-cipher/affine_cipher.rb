require 'byebug'

class Affine
  ALPHABET = ('a'..'z').to_a.join.freeze

  attr_reader :a, :b, :characters

  def initialize(a, b)
    raise ArgumentError, "a must be coprime" unless a.gcd(ALPHABET.length) == 1

    @a = a
    @b = b
  end

  def encode(plaintext)
    process_characters(plaintext.downcase) do |character|
      encrypt(character)
    end.each_slice(5).to_a.map(&:join).join(' ')
  end

  def decode(ciphertext)
    process_characters(ciphertext) do |cipher|
      decrypt(cipher)
    end.join
  end

  private

  def process_characters(characters)
    characters.gsub(/\W/, '').chars.map do |character|
      next character if character.match(/\d/)

      yield(character)
    end
  end

  def encrypt(character)
    index = ((a * ALPHABET.index(character)) + b) % ALPHABET.length
    ALPHABET[index]
  end

  def decrypt(character)
    b_diff = ALPHABET.index(character) - b
    index = (mmi * b_diff) % ALPHABET.length
    ALPHABET[index]
  end

  def mmi
    num = 1

    num += 1 until (a * num) % ALPHABET.length == 1

    num
  end
end

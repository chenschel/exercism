=begin
Write your code for the 'Atbash Cipher' exercise in this file. Make the tests in
`atbash_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/atbash-cipher` directory.
=end

class Atbash
  ALPHABET = ('a'..'z').to_a.join.freeze
  REVERSE_ALPHABET = ALPHABET.reverse

  class << self
    def encode(text)
      text.downcase
          .gsub(/[\s,\.]/, '')
          .tr(ALPHABET, REVERSE_ALPHABET)
          .scan(/.{1,5}/)
          .join(' ')
    end

    def decode(text)
      text.gsub(/\s/, '')
          .tr(REVERSE_ALPHABET, ALPHABET)
    end
  end
end

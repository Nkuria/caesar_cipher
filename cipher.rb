require 'byebug'
class Cipher
  UPPERCASE = ('A'..'Z').to_a
  LOWERCASE = ('a'..'z').to_a

  attr_accessor :key

  def initialize(key)
    @key = key
  end

  def encrypt(str)
    encrypted = []
    str.split('').each do |s|
      encrypted << if UPPERCASE.include?(s)
                     encrypt_new_value(UPPERCASE, s)
                   elsif LOWERCASE.include?(s)
                     encrypt_new_value(LOWERCASE, s)
                   else
                     s
                   end
    end
    encrypted.join('')
  end

  def encrypt_new_value(alphabet, str)
    current_key = alphabet.index(str)
    new_key = (current_key + key) % 26
    alphabet[new_key]
  end

  def decrypt(str)
    decrypted = []
    str.split('').each do |s|
      decrypted << if UPPERCASE.include?(s)
                     decrypt_new_value(UPPERCASE, s)
                   elsif LOWERCASE.include?(s)
                     decrypt_new_value(LOWERCASE, s)
                   else
                     s
                   end
    end
    decrypted.join('')
  end

  def decrypt_new_value(alphabet, str)
    current_key = alphabet.index(str)
    new_key = (current_key - key) % 26
    alphabet[new_key]
  end
end

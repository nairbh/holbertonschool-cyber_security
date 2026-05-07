#!/usr/bin/env ruby

class CaesarCipher
  def initialize(shift)
    @shift = shift
  end

  def encrypt(message)
    cipher(message, @shift)
  end

  def decrypt(message)
    cipher(message, -@shift)
  end

  private

  def cipher(message, shift)
    message.chars.map do |char|
      shift_char(char, shift)
    end.join
  end

  def shift_char(char, shift)
    if char >= 'a'
      if char <= 'z'
        return rotate_letter(char, 'a', shift)
      end
    end
    if char >= 'A'
      if char <= 'Z'
        return rotate_letter(char, 'A', shift)
      end
    end
    char
  end

  def rotate_letter(char, base_char, shift)
    base = base_char.ord
    (((char.ord - base + shift) % 26) + base).chr
  end
end

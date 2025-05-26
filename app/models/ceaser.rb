class Ceaser < ApplicationRecord
  include Encoder
  FORWARD = 1
  BACK = -1

  def encode(message)
    adjust_chars(message, FORWARD)
  end

  def decode(message)
    adjust_chars(message, BACK)
  end

  private

  def adjust_chars(message, direction)
    message.chars.map do |c|
      if direction < 0
        decrement_char(c)
      elsif direction > 0
        increment_char(c)
      end
    end.join.to_s
  end

  def increment_char(c)
    (c.ord + shift).chr
  end

  def decrement_char(c)
    (c.ord - shift).chr
  end
end

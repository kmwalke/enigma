class Ceaser < ApplicationRecord
  include Encoder
  FORWARD = 1
  BACK    = -1

  def encode(message)
    adjust_chars(message, FORWARD)
  end

  def decode(message)
    adjust_chars(message, BACK)
  end

  private

  def adjust_chars(message, direction)
    shift_amount = shift * direction

    message.chars.map do |c|
      (c.ord + shift_amount).chr
    end.join
  end
end

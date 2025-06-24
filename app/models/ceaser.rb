class Ceaser < ApplicationRecord
  include Encoder
  FORWARD = 1
  BACK    = -1

  def encode(message)
    return 'INVALID MESSAGE' unless valid(message)

    adjust_chars(message, FORWARD)
  end

  def decode(message)
    return 'INVALID MESSAGE' unless valid(message)

    adjust_chars(message, BACK)
  end

  private

  def valid(message)
    return false if message.nil?

    message.chars.each do |c|
      return false unless CharacterMap::DECODE_LIST.include?(c)
    end

    true
  end

  def adjust_chars(message, direction)
    shift_amount = shift * direction

    message.chars.map do |c|
      CharacterMap.decode(index(CharacterMap.encode(c) + shift_amount))
    end.join
  end

  def index(number)
    number % CharacterMap.allowed_characters_count
  end
end

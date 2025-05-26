class Ceaser < ApplicationRecord
  include Encoder

  def encode(message)
    message.chars.map do |c|
      (c.ord + shift).chr
    end.join.to_s
  end

  def decode(message)
    message.chars.map do |c|
      (c.ord - shift).chr
    end.join.to_s
  end
end

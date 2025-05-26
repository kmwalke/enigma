require 'rails_helper'

RSpec.describe Ceaser, type: :model do
  let(:ceaser13) { described_class.new(shift: 13) }
  let(:ceaser_neg8) { described_class.new(shift: -8) }
  let(:message) { 'my message' }
  let(:encoded_message13) { encode(message, ceaser13.shift) }
  let(:encoded_message_neg8) { encode(message, ceaser_neg8.shift) }

  it 'encodes a message' do
    expect(ceaser13.encode(message)).not_to eq(message)
  end

  it 'decodes a message' do
    expect(ceaser13.decode(encoded_message13)).to eq(message)
  end

  it 'properly encodes a message', skip: 'string encoding issue' do
    expect(ceaser13.encode(message)).to eq('z\x86-zr\x80\x80ntr')
  end

  it 'properly decodes a message' do
    expect(ceaser13.decode(encoded_message13)).to eq(message)
  end

  private

  def encode(message, shift)
    message.chars.map do |c|
      (c.ord + shift).chr
    end.join
  end
end

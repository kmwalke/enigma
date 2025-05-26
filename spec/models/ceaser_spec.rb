require 'rails_helper'

RSpec.describe Ceaser, type: :model do
  let(:ceaser13) { Ceaser.new(shift: 13) }
  let(:ceaser_8) { Ceaser.new(shift: -8) }
  let(:message) { 'my message' }
  let(:encoded_message13) { ceaser13.encode(message) }
  let(:encoded_message_8) { ceaser_8.encode(message) }

  it 'encodes a message' do
    expect(ceaser13.encode(message)).not_to eq(message)
  end

  it 'decodes a message' do
    expect(ceaser13.decode(encoded_message)).not_to eq(message)
  end

  it 'properly encodes a message' do
    expect(ceaser13.encode(message)).to eq('encoded message')
  end

  it 'properly decodes a message' do
    expect(ceaser13.decode(encoded_message)).to eq(message)
  end
end

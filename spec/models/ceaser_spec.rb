require 'rails_helper'

RSpec.describe Ceaser, type: :model do
  let(:encoder) { Ceaser.new }
  let(:message) { 'my message' }
  let(:encoded_message) { encoder.encode(message) }

  it 'encodes a message' do
    expect(encoder.encode(message)).not_to eq(message)
  end

  it 'decodes a message' do
    expect(encoder.decode(encoded_message)).not_to eq(message)
  end

  it 'properly encodes a message' do
    expect(encoder.encode(message)).to eq('encoded message')
  end

  it 'properly decodes a message' do
    expect(encoder.decode(encoded_message)).to eq(message)
  end
end

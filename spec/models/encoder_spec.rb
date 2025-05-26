require 'rails_helper'

class MockEncoder
  include Encoder
end

RSpec.describe Encoder, type: :module do
  let(:encoder) { MockEncoder.new }
  let(:message) { 'my message' }

  it 'encodes a message' do
    expect(encoder.encode(message)).to eq(message)
  end

  it 'decodes a message' do
    expect(encoder.decode(message)).to eq(message)
  end
end

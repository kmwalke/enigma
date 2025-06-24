require 'rails_helper'

RSpec.describe Ceaser do
  let(:ceaser13) { described_class.new(shift: 13) }
  let(:ceaser_neg8) { described_class.new(shift: -8) }
  let(:message) { 'my message' }
  let(:encoded_message13) { ceaser13.encode(message) }
  let(:encoded_message_neg8) { ceaser_neg8.encode(message) }

  it 'encodes a message' do
    expect(ceaser13.encode(message)).not_to eq(message)
  end

  it 'decodes a message' do
    expect(ceaser13.decode(encoded_message13)).to eq(message)
  end

  it 'properly encodes a message', skip: 'string encoding issue (spec only)' do
    expect(ceaser13.encode(message)).to eq('z\x86-zr\x80\x80ntr')
  end

  it 'properly decodes a message' do
    expect(ceaser13.decode(encoded_message13)).to eq(message)
  end

  it 'handles nil encode inputs' do
    expect(ceaser13.encode(nil)).to be_nil
  end

  it 'handles nil decode inputs' do
    expect(ceaser13.decode(nil)).to be_nil
  end

  it 'handles bad characters' do
    expect(ceaser13.encode('bad_message!@#$%^&*()_+')).to be_nil
  end
end

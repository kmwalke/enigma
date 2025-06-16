require 'rails_helper'

RSpec.feature 'Ceasers' do
  let!(:ceaser3) { Ceaser.create(shift: 3) }

  it 'displays the ceaser page' do
    visit ceaser_path(ceaser3)

    expect(page).to have_content('Output')
  end

  describe 'encoding a message' do
    let(:message) { 'this is my message' }

    before do
      visit ceaser_path(ceaser3)

      fill_in 'Message', with: message
      click_button 'Encode'
    end

    it 'redirects to ceaser#show' do
      expect(page).to have_current_path(ceaser_path(ceaser3))
    end

    it 'displays the encoded message' do
      expect(page).to have_content(ceaser3.encode(message))
    end

    it 'encodes using an encoder map' do
      # Just adding a number to all allowed ruby chars is causing issues
      # 2] pry(main)> c.encode 'The quick red fox jumped over the lazy, brown dog.'
      # => "]qn)z~rlt){nm)ox\x81)s~vynm)x\x7Fn{)}qn)uj\x83\x825)k{x\x80w)mxp7"
      # the \x81 and \x7, etc are causing problems.
      # Create an encoder map
      # This would be an array of allowed chars  SEEMS THAT ONLY LETTERS ARE ALLOWED IN THE ORIGINAL ENIGMA
      # Add Error handling for non allowed chars
      # Preferably the same chars that the enigma used
      # Instead of just adding a ruby int to a ruby char, access the index+encoding_value position of the encoding map
      # This would just be an array of all allowable characters, overflows loop to the beginning
      # Use a class, CharacterMap or something, that all encoders can use
      # CharacterMap.characters = [a,b,c,d,...]
      # use two hashes to encode/decode
      # hash_1 = {a:1, b:2, etc} hash_2 = {1:a, 2:b, etc}
      #   I guess automap this against the allowable characters defined above?
      #   Is there an easy "hash.reverse" method that exchanges keys and values?  So I can change one and auto change the other?
      # one is encoder hash, one is decoder hash
      # 'message" comes in, combine the two to encode
      # 'message'.chars.each do |c|
      #    hash_2[hash_1[c]+shift] // don't forget that overflows roll over somehow
      # end.merge
      # Random Ceaser (Enigma wheels) could use a third hash that maps two numbers together
      #   {1:4, 12:2, etc} for all combos up to 26
      #   use this mapping instead of adding 'shift" to the char

      # In the future, I GUESS, if there is a way to convert all unicode into intergers (which is certainly doable), this is extendable to all unicode
      #   This sounds like a pain in the ass, though

      # TODO: The above has been done, yay!  Add Error handling for chars outside of allowed list
      # TODO: Add Testing for new CharacterMap class
      expect(true).to be(false)
    end
  end
end

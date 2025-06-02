require 'rails_helper'

RSpec.feature 'Ceasers', type: :feature do
  let!(:ceaser3) { Ceaser.create(shift: 3) }

  it 'displays the ceaser page' do
    visit ceaser_path(ceaser3)

    expect(page).to have_content('Output')
  end

  describe 'encoding a message' do
    let(:message) { 'this is my message' }

    before do
      visit ceaser_path(ceaser3)

      fill_in 'Input', with: message
      click_button 'Encode'
    end

    it 'redirects to ceaser#show' do
      expect(page).to have_current_path(ceaser_path(ceaser3))
    end

    it 'displays the encoded message' do
      expect(page).to have_content(ceaser3.encode(message))
    end
  end
end

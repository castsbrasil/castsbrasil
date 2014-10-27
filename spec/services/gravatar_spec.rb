require 'rails_helper'

describe Gravatar do
  let(:invalid_email) { 'me@me.com' }

  context 'Gravatar account exist' do
    let(:valid_email) { 'lccezinha@gmail.com' }
    subject(:gravatar) { Gravatar.new(valid_email) }

    it '.exists?' do
      expect(gravatar.exists?).to eq(true)
    end
  end

  context 'Gravatar account does not exist' do
    let(:invalid_email) { 'me@me.com' }
    subject(:gravatar) { Gravatar.new(invalid_email) }

    it '.exists?' do
      expect(gravatar.exists?).to eq(false)
    end
  end

end
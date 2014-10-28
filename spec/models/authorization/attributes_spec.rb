require 'rails_helper'

describe Authorization::Attributes do
  let(:authorization) { Authorization.new }
  let(:attributes) { Authorization::Attributes.new(authorization) }

  describe '#initialize' do
    it 'should save an authorization in an instance variable' do
      expect(Authorization::Attributes.new(authorization).authorization).to be == authorization
    end
  end

  describe '#set_from_oauth' do
    before :each do
      @oauth = double
      allow(@oauth).to receive_message_chain(:info, :urls, :first, :last).and_return('example.com/profile')
      allow(@oauth).to receive_message_chain(:info, :nickname).and_return('Name')
      allow(@oauth).to receive_message_chain(:info, :image).and_return('http://lorempixel.com/26/26')
    end

    it 'should set the user profile' do
      expect(attributes.set_from_oauth(@oauth).profile_page).to be == 'example.com/profile'
    end

    it 'should return the authorization' do
      expect(attributes.set_from_oauth(@oauth)).to be == authorization
    end
  end
end

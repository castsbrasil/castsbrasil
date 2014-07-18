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
      allow(@oauth).to receive_message_chain(:info, :name)
      allow(@oauth).to receive_message_chain(:info, :nickname).and_return('Name')
    end

    it 'should set the user profile' do
      expect(attributes.set_from_oauth(@oauth).profile_page).to be == 'example.com/profile'
    end

    it 'should set the user nick name' do
      expect(attributes.set_from_oauth(@oauth).nick_name).to be == 'Name'
    end

    it 'should return the authorization' do
      expect(attributes.set_from_oauth(@oauth)).to be == authorization
    end

    context 'from facebook' do
      before :each do
        allow(@oauth).to receive_message_chain(:info, :name).and_return('Facebook Name')
      end

      it 'should set the user nick name' do
        expect(attributes.set_from_oauth(@oauth).nick_name).to be == 'Facebook Name'
      end
    end
  end
end

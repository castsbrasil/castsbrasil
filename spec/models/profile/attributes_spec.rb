require 'rails_helper'

describe Profile::Attributes do
  let(:profile) { Profile.new }
  let(:attributes) { Profile::Attributes.new(profile) }

  describe '#initialize' do
    it 'should save an profile in an instance variable' do
      expect(Profile::Attributes.new(profile).profile).to be == profile
    end
  end

  describe '#set_from_oauth' do
    before :each do
      @oauth = double
      allow(Devise).to receive_message_chain(:friendly_token, :[]).and_return('akhsbfdajwr')
      allow(@oauth).to receive_message_chain(:info, :name).and_return('Name LastName')
    end

    it 'should set the first name' do
      expect(attributes.set_from_oauth(@oauth).first_name).to be == 'Name'
    end
    it 'should set the last name' do
      expect(attributes.set_from_oauth(@oauth).last_name).to be == 'LastName'
    end

    it 'should set the last name with middle names' do
      allow(@oauth).to receive_message_chain(:info, :name).and_return('Name Middle names LastName')
      expect(attributes.set_from_oauth(@oauth).first_name).to be == 'Name'
      expect(attributes.set_from_oauth(@oauth).last_name).to be == 'Middle names LastName'
    end

    it 'should set the first name with middle names' do
      allow(@oauth).to receive_message_chain(:info, :name).and_return('Name Middle names LastName')
      expect(attributes.set_from_oauth(@oauth).first_name).to be == 'Name'
      expect(attributes.set_from_oauth(@oauth).last_name).to be == 'Middle names LastName'
    end

    it 'should return the profile' do
      expect(attributes.set_from_oauth(@oauth)).to be == profile
    end
  end

  describe '#set_from_oauth without last name' do
    before :each do
      @oauth = double
      allow(Devise).to receive_message_chain(:friendly_token, :[]).and_return('akhsbfdajwr')
      allow(@oauth).to receive_message_chain(:info, :name).and_return('Name')
    end

    it 'should set the first name' do
      expect(attributes.set_from_oauth(@oauth).first_name).to be == 'Name'
    end
    it "shouldn't set the last name" do
      expect(attributes.set_from_oauth(@oauth).last_name).to be_empty
    end

    it 'should return the profile' do
      expect(attributes.set_from_oauth(@oauth)).to be == profile
    end
  end

  describe '#set_from_oauth without name' do
    before :each do
      @oauth = double
      allow(Devise).to receive_message_chain(:friendly_token, :[]).and_return('akhsbfdajwr')
      allow(@oauth).to receive_message_chain(:info, :name).and_return('')
      allow(@oauth).to receive_message_chain(:info, :nickname).and_return('nickName')
    end

    it 'should set the first name' do
      expect(attributes.set_from_oauth(@oauth).first_name).to be == 'nickName'
    end
    it "shouldn't set the last name" do
      expect(attributes.set_from_oauth(@oauth).last_name).to be_nil
    end

    it 'should return the profile' do
      expect(attributes.set_from_oauth(@oauth)).to be == profile
    end
  end
end

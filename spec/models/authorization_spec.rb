require 'rails_helper'

describe Authorization do
  let(:authorization) { Authorization.new }
  let(:attributes) { Authorization::Attributes.new(authorization) }
  let(:associate) { Authorization::Associate.new(authorization) }

  it { expect(subject).to belong_to(:user) }

  describe '#values' do
    it 'should return an instance of attributes' do
      expect(authorization.values).to be_an_instance_of(Authorization::Attributes)
    end

    it 'should return an instance of attributes initialized with himself' do
      expect(authorization.values.authorization).to be == authorization
    end

    it 'should return the same object on a second call' do
      expect(authorization.values).to be == authorization.values
    end
  end

  describe '#associate' do
    it 'should return an instance of associate' do
      expect(authorization.associate).to be_an_instance_of(Authorization::Associate)
    end

    it 'should return an instance of associate initialized with himself' do
      expect(authorization.associate.authorization).to be == authorization
    end

    it 'should return the same object on a second call' do
      expect(authorization.associate).to be == authorization.associate
    end
  end

  describe '#set_attributes_from_oauth' do
    before :each do
      allow(authorization).to receive(:values).and_return(attributes)
      allow(attributes).to receive(:set_from_oauth).and_return(authorization)
      @oauth = double
    end

    it 'should set the attributes and return self' do
      expect(authorization.set_attributes_from_oauth(@oauth)).to be == authorization
    end
  end

  describe '#associate_user_from' do
    before :each do
      allow(authorization).to receive(:associate).and_return(associate)
      allow(associate).to receive(:user_from).and_return(authorization)
      @oauth = double
      @user = double
    end

    it 'should associate the user and return self' do
      expect(authorization.associate_user_from(@oauth, @user)).to be == authorization
    end
  end

  describe '.find_or_create_by_oauth' do
    before :each do
      @oauth = double
      @user = double
      allow(Authorization::Oauth).to receive(:find_or_create_by).and_return(authorization)
    end

    it 'should find or initialize an authorization from oauth and return it' do
      expect(Authorization.find_or_create_by_oauth(@oauth, @user)).to be == authorization
    end
  end
end
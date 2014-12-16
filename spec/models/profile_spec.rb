require 'rails_helper'

describe Profile do
  let(:profile) { Profile.new }
  let(:attributes) { Profile::Attributes.new(profile) }

  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to have_many(:links).dependent(:destroy) }
  it { expect(subject).to validate_presence_of(:first_name) }
  it { expect(subject).to accept_nested_attributes_for(:links) }

  context '#full_name' do
    it 'should match the full name' do
      @profile = build(:profile)
      expect(@profile.full_name).to eq("#{@profile.first_name} #{@profile.last_name}")
    end
  end

  describe '#avatar' do
    context 'with a github account' do
      before :each do
        allow(profile).to receive_message_chain(:user, :authorizations, :github, :avatar_url).and_return('http://lorempixel.com/26/26')
      end

      it 'return the github image' do
        expect(profile.avatar).to eq('http://lorempixel.com/26/26')
      end
    end

    context 'with a gravatar image' do
      before :each do
        allow(profile).to receive_message_chain(:user, :authorizations, :github).and_return(nil)
        allow(profile).to receive_message_chain(:user, :email).and_return('')
        allow_any_instance_of(Gravatar).to receive(:image_url).and_return('www.example.com')
      end

      it 'return gravatar image url' do
        expect(profile.avatar).to eq('www.example.com')
      end
    end
  end

  describe '#values' do
    it 'should return an instance of attributes' do
      expect(profile.values).to be_an_instance_of(Profile::Attributes)
    end

    it 'should return an instance of attributes initialized with himself' do
      expect(profile.values.profile).to be == profile
    end

    it 'should return the same object on a second call' do
      expect(profile.values).to be == profile.values
    end
  end

  describe '#set_attributes_from_oauth' do
    before :each do
      allow(profile).to receive(:values).and_return(attributes)
      allow(attributes).to receive(:set_from_oauth).and_return(profile)
      @oauth = double
    end

    it 'should set the attributes and return self' do
      expect(profile.set_attributes_from_oauth(@oauth)).to be == profile
    end
  end

  describe '.new_from_oauth' do
    before :each do
      allow(Profile).to receive(:new).and_return(profile)
      allow(profile).to receive(:set_attributes_from_oauth).and_return(profile)
      @oauth = double
    end

    it 'should initialize an user from oauth and return it' do
      expect(Profile.new_from_oauth(@oauth)).to be == profile
    end
  end
end

require 'rails_helper'

describe Profile do
  let(:profile) { Profile.new }
  let(:attributes) { Profile::Attributes.new(profile) }

  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to have_many(:links).dependent(:destroy) }
  it { expect(subject).to accept_nested_attributes_for(:links) }

  context "validations" do
    let(:validation_errors) { subject.errors }

    before :each do
      subject.valid?
    end

    [:first_name].each do |attr|
      it "validates presence of #{attr}" do
        expect(validation_errors).to have_key(attr)
      end
    end
  end

  context "#full_name" do
    it 'should match the full name' do
      @profile = build(:profile)
      expect(@profile.full_name).to eq("#{@profile.first_name} #{@profile.last_name}")
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

  context '#avatar' do
    context 'github' do
      let(:user) { create(:user) }
      let(:profile) { create(:profile, user_id: user.id) }
      let(:github_authorization) { create(:authorization, :github, user_id: user.id, avatar_url: 'http://lorempixel.com/26/26') }

      it do
        user.authorizations << github_authorization
        expect(profile.avatar).to eq('http://lorempixel.com/26/26')
      end
    end

    context 'gravatar' do
      let(:user) { create(:user, email: 'lccezinha@gmail.com') }
      let(:profile) { create(:profile, user_id: user.id) }
      let(:gravatar) { Gravatar.new(user.email) }

      it { expect(profile.avatar).to eq(gravatar.url) }
    end
  end

end

require 'rails_helper'

describe User do
  let(:user) { User.new }
  let(:attributes) { User::Attributes.new(user) }
  let(:profile) { Profile.new }

  it 'SOCIALS should return a list of social networks' do
    expect(User::SOCIALS).to be == [:github]
  end

  it 'should have many roles' do
    expect(user).to respond_to(:has_role?, :add_role)
  end

  it { expect(subject).to have_many(:authorizations).dependent(:destroy) }
  it { expect(subject).to have_many(:casts).dependent(:destroy) }
  it { expect(subject).to have_one(:profile).dependent(:destroy) }
  it { expect(subject).to have_many(:scores).dependent(:destroy) }
  it { expect(subject).to belong_to(:level) }

  context 'after create' do
    it 'should create a profile' do
      expect { create(:user) }.to change(Profile, :count).by(1)
    end
  end

  context 'before validation' do
    before :each do
      user.valid?
    end

    it 'should associate a free role' do
      expect(user.roles).to be == [Role.find_by_name('free')]
    end
  end

  describe '.find_or_initialize_by_oauth' do
    before :each do
      allow(Authorization).to receive_message_chain(:find_or_initialize_by_oauth, :user).and_return(user)
    end

    it 'should return a user' do
      expect(User.find_or_initialize_by_oauth({}, nil)).to be == user
    end
  end

  describe '#values' do
    it 'should return an instance of attributes' do
      expect(user.values).to be_an_instance_of(User::Attributes)
    end

    it 'should return an instance of attributes initialized with himself' do
      expect(user.values.user).to be == user
    end

    it 'should return the same object on a second call' do
      expect(user.values).to be == user.values
    end
  end

  describe '#set_attributes_from_oauth' do
    before :each do
      allow(user).to receive(:values).and_return(attributes)
      allow(attributes).to receive(:set_from_oauth).and_return(user)
      @oauth = double
    end

    it 'should set the attributes and return self' do
      expect(user.set_attributes_from_oauth(@oauth)).to be == user
    end
  end

  describe '.new_from_oauth' do
    before :each do
      allow(User).to receive(:new).and_return(user)
      allow(user).to receive(:set_attributes_from_oauth).and_return(user)
      allow(Profile).to receive(:new_from_oauth).and_return(profile)
      @oauth = double
    end

    it 'should initialize an user from oauth and return it' do
      expect(User.new_from_oauth(@oauth)).to be == user
    end

    it 'should initialize an profile from oauth and set it to the user' do
      expect(User.new_from_oauth(@oauth).profile).to be == profile
    end
  end

  describe '.new_with_session' do
    before :each do
      @hash = { email: 'email@example.com', profile_attributes: { first_name: 'Firstname', last_name: 'Lastname' } }
      @user = User.new(@hash)
      @profile = Profile.new(@hash[:profile_attributes])

      allow(User).to receive(:new).with({}).and_return(user)
      allow(Profile).to receive(:new).with({}).and_return(profile)
      allow(User).to receive(:new).with(@hash).and_return(@user)
      allow(Profile).to receive(:new).with(@hash[:profile_attributes]).and_return(@profile)
    end

    it 'should initialize an user from session and return it' do
      expect(User.new_with_session({}, nil)).to be == user
    end

    it 'should initialize an profile and set it to the user' do
      expect(User.new_with_session({}, nil).profile).to be == profile
    end

    it 'should create an user from hash and return it' do
      expect(User.new_with_session(@hash, nil)).to be == @user
      expect(User.new_with_session(@hash, nil).email).to be == @hash[:email]
    end

    it 'should create an profile from hash and set it to the user' do
      expect(User.new_with_session(@hash, nil).profile).to be == @profile
      expect(User.new_with_session(@hash, nil).profile.first_name).to be == @hash[:profile_attributes][:first_name]
      expect(User.new_with_session(@hash, nil).profile.last_name).to be == @hash[:profile_attributes][:last_name]
    end
  end

  describe '#password_required?' do
    context 'without authorizations' do
      context 'on a new user' do
        it 'should return true' do
          expect(user.password_required?).to be == true
        end
      end

      context 'on a persisted user' do
        context 'with nil password' do
          before :each do
            allow(user).to receive(:persisted?).and_return(true)
            user.password = nil
            user.password_confirmation = 'password'
          end

          it 'should return true' do
            expect(user.password_required?).to be == true
          end
        end

        context 'with nil confirmation_password' do
          before :each do
            allow(user).to receive(:persisted?).and_return(true)
            user.password = 'password'
            user.password_confirmation = nil
          end

          it 'should return true' do
            expect(user.password_required?).to be == true
          end
        end
      end
    end

    context 'with authorizations and a blank password' do
      before :each do
        allow(user).to receive_message_chain(:authorizations, :empty?).and_return(false)
        user.password = ''
      end

      it 'should return false' do
        expect(user.password_required?).to be == false
      end
    end

    context 'with authorizations and a nil password' do
      before :each do
        allow(user).to receive_message_chain(:authorizations, :empty?).and_return(false)
        user.password = nil
      end

      it 'should return false' do
        expect(user.password_required?).to be == false
      end
    end

    context 'with authorizations and a password' do
      before :each do
        allow(user).to receive_message_chain(:authorizations, :empty?).and_return(false)
        user.password = 'password'
      end

      it 'should return true' do
        expect(user.password_required?).to be == true
      end
    end
  end
end

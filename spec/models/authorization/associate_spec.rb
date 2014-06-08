require 'spec_helper'

describe Authorization::Associate do
  let(:authorization) { Authorization.new }
  let(:associate) { Authorization::Associate.new(authorization) }

  describe '#initialize' do
    it 'should save an authorization in an instance variable' do
      expect(Authorization::Associate.new(authorization).authorization).to be == authorization
    end
  end

  describe '#user_from' do
    before :each do
      @oauth = { 'info' => { 'email' => 'email' } }
      @user = User.new
      @current_user = User.new
      @database_user = User.new
      @oauth_user = User.new
    end

    it 'should return the authorization' do
      expect(associate.user_from(@oauth, @current_user)).to be == authorization
    end

    context 'on an authorization with an user already associated' do
      before :each do
        allow(authorization).to receive(:user).and_return(@user)
      end

      it 'should leave it!' do
        expect(associate.user_from(@oauth, @current_user).user).to be == @user
      end
    end

    context 'on an authorization without an user associated' do
      context 'with an authenticated user' do
        it 'should associate it!' do
          expect(associate.user_from(@oauth, @current_user).user).to be == @current_user
        end
      end

      context 'with an user from database' do
        before :each do
          allow(User).to receive(:where).and_return([@database_user])
        end

        it 'should associate it!' do
          expect(associate.user_from(@oauth, nil).user).to be == @database_user
        end
      end

      context 'with a new user from oauth' do
        before :each do
          allow(User).to receive(:new_from_oauth).and_return(@oauth_user)
        end

        it 'should associate it!' do
          expect(associate.user_from(@oauth, nil).user).to be == @oauth_user
        end
      end
    end
  end
end
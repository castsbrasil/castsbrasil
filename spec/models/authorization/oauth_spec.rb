require 'rails_helper'

describe Authorization::Oauth do
  let(:user) { User.new }
  let(:authorization) { Authorization.new }
  let(:oauth) { Authorization::Oauth.new }

  describe '.find_or_initialize_by' do
    before :each do
      @oauth = double
      allow(Authorization).to receive_message_chain(:find_from_oauth, :first_or_initialize).and_return(authorization)
      authorization.class_eval do
        attr_reader :saved
        def set_attributes_from_oauth(oauth); self.profile_page = 'profile_page'; end
        def associate_user_from(oauth, user); self.user = user; end
      end
    end

    it 'should set the attributes from oauth' do
      expect(Authorization::Oauth.find_or_initialize_by(@oauth, user).profile_page).to be == 'profile_page'
    end

    it 'should associate the user' do
      expect(Authorization::Oauth.find_or_initialize_by(@oauth, user).user).to be == user
    end

    it 'should return the authorization' do
      expect(Authorization::Oauth.find_or_initialize_by(@oauth, user)).to be == authorization
    end
  end
end

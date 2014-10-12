require 'rails_helper'

RSpec.describe ProfilesController, :type => :controller do
  describe "#resource" do
    it "should return current user" do
      user = create(:user)
      sign_in user
      expect(subject.send('resource')).to eq(user)
    end
  end

  describe "#resource_class" do
    it "should return current user" do
      expect(subject.send('resource_class')).to eq(User)
    end
  end

  describe "#resource_name" do
    it "should return current user" do
      expect(subject.send('resource_name')).to eq("user")
    end
  end

  describe "PUT update" do
    context "unlogged user" do
      it "redirects to login page" do
        sign_in nil
        put :update
        expect(subject).to redirect_to(new_user_session_path)
      end
    end

    context "logged user" do
      let(:user) { create(:user) }

      before(:each) do
        sign_in user
      end

      context "profile with right params" do
        it "returns http success" do
          put :update, profile: attributes_for(:profile)
          expect(response).to redirect_to(edit_user_registration_path)
        end

        it "updates the profile" do
          expect { put :update, profile: attributes_for(:profile, first_name: 'new name') }.to change(Profile, :count).by(0)
          expect(user.profile.first_name).to eq('new name')
        end
      end
    end
  end
end
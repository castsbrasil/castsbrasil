require 'rails_helper'

describe Profile do
  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to have_many(:links).dependent(:destroy) }
  it { expect(subject).to accept_nested_attributes_for(:links) }
  context "#full_name" do
    it 'should match the full name' do
      @profile = build(:profile)
      expect(@profile.full_name).to eq("#{@profile.first_name} #{@profile.last_name}")
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

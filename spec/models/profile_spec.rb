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
end

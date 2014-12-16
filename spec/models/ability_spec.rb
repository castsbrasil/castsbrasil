require 'rails_helper'
require 'cancan/matchers'

describe Ability do
  let(:user) { User.new }
  let(:ability) { Ability.new(user) }

  context 'on admin' do
    before :each do
      user.add_role :admin
    end

    it { expect(ability).to be_able_to(:update, Profile, id: user.id) }
    it { expect(ability).to be_able_to(:manage, :all) }
  end

  context 'on visitor' do
    it { expect(ability).to be_able_to(:update, Profile, id: user.id) }
    it { expect(ability).to_not be_able_to(:manage, :all) }
  end
end

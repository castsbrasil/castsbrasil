require 'rails_helper'
require 'cancan/matchers'

describe Ability do
  context 'on admin' do
    before :each do
      user = User.new
      user.add_role :publisher
      user.add_role :admin
      @ability = Ability.new(user)
    end
    it { expect(@ability).to be_able_to(:manage, :all) }
  end
  context 'on visitor' do
    before :each do
      user = User.new
      user.add_role :visitor
      @ability = Ability.new(user)
    end
    it { expect(@ability).to_not be_able_to(:manage, :all) }
  end
end

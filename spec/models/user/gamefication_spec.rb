require 'rails_helper'

describe User do
  let(:user) { create(:user) }
  before do
    create_list(:level, 10)
  end

  context 'after create'  do
    it 'should have zero points' do
      expect(user.total_score).to be(0)
    end

    it 'should have one level' do
      expect(user.level).to_not be(nil)
    end
  end

  context 'gain score' do
    before do
      user.scores.create(value:100)
    end
    it 'should increment the score' do
      user.scores.create(value:100)
      expect(user.total_score).to be(200)
    end

    it 'should increment the level' do
      user.scores.create(value:100)
      expect(user.level).to eq(Level.first_by_score(user.total_score))
    end

    context 'should have a level with rule' do
      before do
        create(:level, name: "Level Dummy",role: Role.find_or_create_by(name: :fake_role), required_score: 9999)
        user.scores.create(value:9999)
      end
      it'should have a dummy role' do
        expect(user.has_role? :fake_role).to be(true)
      end
    end

    context 'and decrement score' do
      before do
        user.scores.create(value: -100)
      end

      it 'should have zero points' do
        expect(user.total_score).to be(0)
      end

      it 'should be have the first level' do
        expect(user.level).to eq(Level.first_by_score(0))
      end
    end
  end
end

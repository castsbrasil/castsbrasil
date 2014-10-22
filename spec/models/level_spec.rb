require 'rails_helper'

describe Level do

  context '.validates' do
    it { should validate_numericality_of(:required_score).only_integer }
    it { should validate_uniqueness_of(:name) }
  end

  describe '.by_score(score)' do
    before { create(:level) }

    it 'should find level by pontution' do
      expect(Level.first_by_score(100).id).to eq(Level.first.id)
    end
  end

  describe '.order_by_required' do
    before do
      create(:level)
      create(:level, required_score: 30)
    end

    it 'should find level by order' do
      expect(Level.order_by_required.first.id).to eq(Level.first.id)
    end
  end

  describe '.first_by_score' do
    let!(:level) { create(:level, required_score: 70) }
    before do
      create(:level)
      create(:level, required_score: 71)
    end

    it 'should find level by first score' do
      expect(Level.first_by_score(70)).to eq(level)
    end
  end

end

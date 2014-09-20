require 'rails_helper'
describe Level do
  context '.validates' do
    it { should validate_numericality_of(:required_score).only_integer }
    it { should validate_uniqueness_of(:name) }
  end
  describe '.by_score(param)' do
    before { create(:level) }
    it 'should find level by pontution' do
      expect(Level.by_score(100).id).to eq(Level.first.id)
    end
  end
end

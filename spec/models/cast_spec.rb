require 'rails_helper'

describe Cast do
  let(:cast) { create(:cast) }
  it { expect(subject).to belong_to(:user)                             }
  it { expect(subject).to have_many(:tag_relationships)                }
  it { expect(subject).to have_many(:tags).through(:tag_relationships) }

  describe '.find_by_param(param)' do
    it 'should find cast by to_param' do
      expect(Cast.find_by_param(cast.to_param)).to eq(cast)
    end
  end
end

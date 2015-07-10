require 'rails_helper'

describe Cast do
  let(:cast) { create(:cast) }

  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to have_and_belong_to_many(:tags) }
  it { expect(subject).to have_many(:cast_transitions) }

  describe '.find_by_param(param)' do
    # it 'should find cast by to_param' do
    #   expect(Cast.find_by_param(cast.to_param)).to eq(cast)
    # end
  end

  describe '#current_state' do
    it 'should be in initial state' do
      expect(cast.current_state.to_sym).to eq(:started)
    end
  end

  describe '#can_transition_to?' do
    context 'on a cast with initial state' do
      it 'can changes to approved state' do
        expect(cast.can_transition_to?(:need_improvement)).to eq(true)
      end

      it 'can changes to need_improvement state' do
        expect(cast.can_transition_to?(:approved)).to eq(true)
      end

      it 'can changes to not_approved state' do
        expect(cast.can_transition_to?(:not_approved)).to eq(true)
      end
    end

    context 'on a cast with approved state' do
      before(:each) do
        cast.transition_to!(:approved)
      end

      it 'can changes to need_improvement state' do
        expect(cast.can_transition_to?(:need_improvement)).to eq(true)
      end
    end

    context 'on a cast with need_improvement state' do
      before(:each) do
        cast.transition_to!(:need_improvement)
      end

      it 'can changes to approved state' do
        expect(cast.can_transition_to?(:approved)).to eq(true)
      end
    end

    context 'on a cast with not_approved state' do
      before(:each) do
        cast.transition_to!(:not_approved)
      end

      it 'can`t changes to initial state' do
        expect(cast.can_transition_to?(:started)).to eq(false)
      end

      it 'can`t changes to approved state' do
        expect(cast.can_transition_to?(:approved)).to eq(false)
      end

      it 'can`t changes to need_improvement state' do
        expect(cast.can_transition_to?(:need_improvement)).to eq(false)
      end
    end
  end

  describe 'valid urls' do
    it "it's a url" do
      expect(cast.send(:is_valid_url?)).to eq(true)
    end

    it "should be a regular url" do
      expect(cast.errors[:url]).to be_empty
    end

  end
end

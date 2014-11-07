require 'rails_helper'

describe ApplicationHelper do
  describe '.show_avatar' do
    let(:current_user) { create(:user) }
    let(:profile) { create(:profile, user_id: current_user.id) }

    context 'with an avatar' do
      before :each do
        allow_any_instance_of(Gravatar).to receive(:image_url).and_return('www.example.com')
      end

      it 'should receive an avatar' do
        expect(show_avatar).to match(/www.example.com/)
      end
    end

    context 'without an avatar' do
      before :each do
        allow_any_instance_of(Gravatar).to receive(:image_url).and_return(nil)
      end

      it 'should receive an empty image' do
        expect(show_avatar).to match(/lorempixel.com/)
      end
    end
  end
end

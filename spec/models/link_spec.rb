require 'rails_helper'

describe Link do
  it { expect(subject).to belong_to(:profile) }

  context 'validation' do
    it {expect(subject).to validate_presence_of(:name)}
    it {expect(subject).to validate_presence_of(:url)}

    describe 'format' do
      it 'should accept links with http' do
        expect(build(:link, url: 'http://www.test.com')).to be_valid
      end

      it 'should accept links with https' do
        expect(build(:link, url: 'https://www.test.com')).to be_valid
      end

      it 'should not accept links without http or https' do
        expect(build(:link, url: 'www.test.com')).to_not be_valid
      end
    end
  end
end

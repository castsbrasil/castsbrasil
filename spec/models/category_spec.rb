require 'rails_helper'

describe Category do
  context "validations" do
    let(:validation_errors) {
      subject.valid?
      subject.errors
    }

    [:name].each do |attr|
      it "validates presence of #{attr}" do
        expect(validation_errors).to have_key(attr)
      end
    end
  end
end

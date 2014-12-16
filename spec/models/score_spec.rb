require 'rails_helper'

describe Score do
  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to validate_numericality_of(:value).only_integer }
  it { expect(subject).to validate_presence_of(:value) }
end

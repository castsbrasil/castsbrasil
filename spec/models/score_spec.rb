require 'rails_helper'

describe Score do
  it { expect(subject).to belong_to(:user) }
  it { should validate_numericality_of(:value).only_integer }
  it { should validate_presence_of(:value) }

end

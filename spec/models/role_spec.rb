require 'rails_helper'

describe Role do
  it { expect(subject).to have_and_belong_to_many(:users) }
  it { expect(subject).to belong_to(:resource) }
end
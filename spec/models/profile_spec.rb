require 'rails_helper'

describe Profile do
  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to have_many(:links).dependent(:destroy) }
  it { expect(subject).to accept_nested_attributes_for(:links) }
end

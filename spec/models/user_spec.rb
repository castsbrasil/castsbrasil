require 'rails_helper'

describe User do
  it { expect(subject).to have_many(:authorizations) }
end
require 'rails_helper'

describe Tag do
  it { expect(subject).to have_and_belong_to_many(:casts) }
end

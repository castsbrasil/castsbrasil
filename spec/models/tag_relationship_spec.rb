require 'rails_helper'

describe TagRelationship do
  let(:tag) { TagRelationship.new }

  it { expect(subject).to belong_to(:tag) }
  it { expect(subject).to belong_to(:taggable).counter_cache(:taggables_count) }
end

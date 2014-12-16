require 'rails_helper'

describe Category do
  it { expect(subject).to validate_presence_of(:name) }
end

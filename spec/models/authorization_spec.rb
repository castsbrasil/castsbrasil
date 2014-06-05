require 'rails_helper'

describe Authorization do
  it { expect(subject).to belong_to(:user) }
end
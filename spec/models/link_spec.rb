require 'rails_helper'
require 'validates_host/require_a_valid_domain_name_matcher'

describe Link do
  it { expect(subject).to belong_to(:profile) }
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_presence_of(:url) }
  it { expect(subject).to require_a_valid_domain_name(:url) }
end

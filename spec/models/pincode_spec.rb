require 'rails_helper'

RSpec.describe Pincode, type: :model do
  it { is_expected.to validate_presence_of(:code) }
  it { should belong_to(:state).optional }
end

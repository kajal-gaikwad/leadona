require 'rails_helper'

RSpec.describe City, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { should belong_to(:state).optional }
end

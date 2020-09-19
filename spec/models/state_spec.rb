require 'rails_helper'

RSpec.describe State, type: :model do 
  it { should allow_value("", nil).for(:name) } 
  it { should allow_value("", nil).for(:code) }
end

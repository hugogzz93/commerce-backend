require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should belong_to(:order) }
  it { should validate_presence_of(:order) }
  it { should define_enum_for(:status).with([ :pending, :failed, :success]) }
end

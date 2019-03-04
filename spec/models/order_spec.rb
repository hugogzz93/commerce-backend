require 'rails_helper'

RSpec.describe Order, type: :model do
  it {should validate_presence_of(:vendor)}
  it {should validate_presence_of(:client)}
  it {should validate_presence_of(:status)}
  it {should validate_presence_of(:group_id)}
  it {should belong_to(:client)}
  it {should belong_to(:vendor)}
  it {should define_enum_for(:status).with([ :in_progress, :in_transit, :delivered, :canceled])}
end

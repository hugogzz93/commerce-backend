require 'rails_helper'

RSpec.describe Order, type: :model do
  it {should validate_presence_of(:vendor)}
  it {should validate_presence_of(:client)}
  it {should validate_presence_of(:status)}
  it {should validate_presence_of(:address)}
  it {should belong_to(:client)}
  it {should belong_to(:vendor)}
  it {should belong_to(:address)}
  it {should have_many(:order_items).dependent(:destroy)}
  it {should define_enum_for(:status).with([ :in_progress, :in_transit, :delivered, :canceled])}
end

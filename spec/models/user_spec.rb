require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should have_many(:products) }
  it { should have_many(:order_items_as_vendor) }
  it { should have_many(:order_items_as_client) }
  it { should have_many(:orders_as_vendor) }
  it { should have_many(:orders_as_client) }
end

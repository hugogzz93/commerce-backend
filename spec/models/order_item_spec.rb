require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  subject { create :order_item }
  it {should belong_to(:order)}
  it {should belong_to(:product)}
  it {should have_one(:vendor)}
  it {should have_one(:client)}

  context 'on creation' do
    it { expect(subject.price).to eq(subject.product.price) }
  end
end

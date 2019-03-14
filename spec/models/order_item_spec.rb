require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  subject { create :order_item }
  it {should belong_to(:order)}
  it {should belong_to(:product)}
  it {should have_one(:vendor)}
  it {should have_one(:client)}

  it { should validate_presence_of(:amount) }
  it { should validate_numericality_of(:amount).is_less_than_or_equal_to(subject.product.stock) }
  it { should validate_numericality_of(:amount).is_greater_than(0).only_integer }

  context 'on creation' do
    before do
      @orderItem = create :order_item
    end

    describe 'inventory integrity' do
      xit 'should reduce inventory stock by ordered amount'
    end

    describe 'product integrity' do
      it 'should have same price as its product' do
        expect(@orderItem.price).to eq(@orderItem.product.price)
      end
    end

  end
end

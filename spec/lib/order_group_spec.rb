require 'rails_helper'

class Grouper
  extend OrderGrouper
end

RSpec.describe do 
  subject { Grouper.new }
  let(:orders) { create_list(:order, rand(2..5))}

  describe '.make_group' do
    context 'when it is given an array of orders' do
      subject { Grouper.make_group(orders).map(&:group_id) }
      it 'should give the same id of to all in group' do
        is_expected.to be_all_equal
      end
    end
  end

  describe '.create_group' do
    INVALID_ITEM_AMOUNT = -1
    ORDER_AMOUNT = 5

    describe 'atomicity' do
      before(:each) do
        @orders = build_list :order_with_items, ORDER_AMOUNT
      end

      context 'when there is an invalid order' do
        before do
          @orders[0].order_items[0].amount = INVALID_ITEM_AMOUNT
        end

        it 'commits nothing to database' do
          expect { Grouper.create_group(@orders) }.not_to change { Order.count }
        end
      end

      context 'when orders are valid' do
        it 'commits orders to database' do
          expect { Grouper.create_group(@orders) }.to change { Order.count }.by(ORDER_AMOUNT)
        end
      end

    end
  end
end



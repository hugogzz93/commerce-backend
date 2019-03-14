require 'rails_helper'

RSpec.describe do 
  subject { OrderGrouper }
  let(:orders) { create_list(:order, rand(2..5))}

  describe '.make_group' do
    context 'when it is given an array of orders' do
      subject { OrderGrouper.make_group(orders).map(&:group_id) }
      it 'should give the same id of to all in group' do
        is_expected.to be_all_equal
      end
    end
  end

  describe '.create_group!' do
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
          expect { 
            begin
              subject.create_group!(@orders)
            rescue
            end
          }.not_to change { Order.count }

        end

        it 'raises RecordInvalid' do
          expect{ subject.create_group!(@orders) }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'when orders are valid' do
        it 'commits orders to database' do
          expect { subject.create_group!(@orders) }.to change { Order.count }.by(ORDER_AMOUNT)
        end
      end

    end
  end
end



require 'rails_helper'

RSpec.describe OrderGroup do
  let(:group) { OrderGrouper.create_group! build_list(:order, 3) }

  describe '#status' do
    subject { group.status }
    context 'order has no orders' do
    end

    context 'all orders have been canceled' do
      before do
        group.orders.each(&:canceled!)
      end

      it { is_expected.to be(:canceled)}
    end

    context 'not all orders have been canceled' do
      context 'it has canceled orders' do
        it 'should ignore canceled orders' do
        end

      end
      context 'not all orders have been delivered' do
        before do
          group.orders.last.in_progress!
          group.orders.first.delivered!
        end

        it { is_expected.to be(:in_progress)}
      end
      context 'all orders have been delivered' do
        before do
          group.orders.each(&:delivered!)
        end

        it { is_expected.to be(:delivered)}
      end
    end
  end

end

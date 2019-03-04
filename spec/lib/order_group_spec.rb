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
end



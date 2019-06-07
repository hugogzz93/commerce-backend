require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) {create :address}
  let(:user) {address.user}
  subject { address }
  it { should validate_presence_of(:user) }
  it { should belong_to(:user) }
  it { should have_many(:orders) }

  describe '.validate_only_one_default_address' do
    before do
      addresses = create_list :address, 5, user: user
      addresses.first.update(is_default_delivery_address: true)
    end

    context 'if the address becomes the default delivery address' do
      before do
        address.update is_default_delivery_address: true
      end
      it 'unset any other address with that flag' do
        expect(user.addresses.where.not(id: address.id).any?(&:is_default_delivery_address)).to be false
      end
    end
  end
end

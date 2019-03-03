require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { create(:product)}
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:price)}
  it { should validate_presence_of(:stock)}
  it { should validate_presence_of(:user)}
  it { should validate_presence_of(:category)}
  it { should validate_uniqueness_of(:name).scoped_to(:user_id).case_insensitive }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:stock).is_greater_than_or_equal_to(0).only_integer }
  it { should belong_to(:user)}
  it { should belong_to(:category)}
end

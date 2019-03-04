RSpec::Matchers.define :be_all_equal do
  match do |actual|
    actual.all? {|e| e === actual.first}
  end
end

# RSpec.describe [1,1,1] do
#   it { is_expected.to be_all_equal }
# end
#
# RSpec.describe [] do
#   it { is_expected.to be_all_equal}
# end
#
# RSpec.describe [2,1,1] do
#   it { is_expected.not_to be_all_equal}
# end

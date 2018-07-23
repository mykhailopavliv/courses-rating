RSpec.shared_examples 'user policy examples' do |permit_actions, forbid_actions|
  it { is_expected.to permit_actions(permit_actions) }
  it { is_expected.to forbid_actions(forbid_actions) }
end

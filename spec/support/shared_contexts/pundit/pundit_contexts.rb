RSpec.shared_context 'user policy context' do |permit_actions, forbid_actions|
  context 'for user' do
    include_examples 'user policy examples', permit_actions, forbid_actions
  end
end

RSpec.shared_context 'admin policy context' do
  context 'for admin' do
    let(:user) { create(:user, role: 'admin') }

    it { is_expected.to permit_actions(%i[index show create new update edit destroy]) }
  end
end

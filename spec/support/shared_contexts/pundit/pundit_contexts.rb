RSpec.shared_context 'admin policy context' do
  context 'for admin' do
    let(:user) { create(:user, role: 'admin') }

    it { is_expected.to permit_actions(%i[index show create new update edit destroy]) }
  end
end

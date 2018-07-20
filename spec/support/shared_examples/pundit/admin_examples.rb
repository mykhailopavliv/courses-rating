RSpec.shared_examples 'admin examples' do |actions|
  # it { expect(subject).to respond_with(:ok) }
  # it { expect(subject).to render_template(:index) }
  # it { expect(assigns(assigned_resource)).to match(resource_class.all) }

  it { is_expected.to permit_actions(actions) }
end
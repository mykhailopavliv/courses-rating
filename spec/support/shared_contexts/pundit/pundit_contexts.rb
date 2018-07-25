RSpec.shared_context 'admin course policy context' do
  context 'for admin' do
    let(:user) { create(:user, role: 'admin') }

    it { is_expected.to permit_actions(%i[index show create new update edit destroy]) }
  end
end

RSpec.shared_context 'admin pending policy context' do |record_class_name, record_published|
  context record_published ? 'published' : 'unpublished' + ' record' do
    let(:record_class) { record_class_name.constantize }
    let(:record_factory_name) { record_class_name.downcase }

    let(:record) { create(record_factory_name, published: record_published) }
    let(:resolved_scope) { described_class::Scope.new(user, record_class.all).resolve }

    let(:user) { nil }
    include_context 'user pending policy context', 'visitor'

    let(:user) { create(:user) }
    include_context 'user pending policy context', 'user'

    let(:owner_record) do
      { Course: create(:course, owner_id: user.id, published: record_published),
        Review: create(:review, course: create(:course), published: record_published) }
    end

    let(:record) { owner_record[record_class_name] }
    include_context 'user pending policy context', 'owner'

    context 'for admin' do
      let(:user) { create(:user, role: 'admin') }
      let(:record) { create(record_factory_name, published: record_published) }

      it('in resolved scope') do
        expect(resolved_scope).to record_published ? exclude(record) : include(record)
      end
      it { is_expected.to permit_action(:change_status) }
    end
  end
end

RSpec.shared_context 'user pending policy context' do |user_role|
  context 'for ' + user_role do
    it('not in resolved scope') { expect(resolved_scope).to exclude(record) }
    it { is_expected.to forbid_action(:change_status) }
  end
end

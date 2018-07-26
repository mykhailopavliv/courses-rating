require 'rails_helper'

describe CoursePolicy, 'for admin with' do
  subject { described_class.new(user, course) }

  let(:user) { create(:user, role: 'admin') }
  let(:course) { create(:course) }
  let(:resolved_scope) { described_class::Scope.new(user, Course.all).resolve }

  context 'published course' do
    let(:course) { create(:course, published: true) }

    it('in resolved scope') { expect(resolved_scope).to include(course) }
    include_context 'admin course policy context'
  end

  context 'unpublished course' do
    let(:course) { create(:course) }

    it('in resolved scope') { expect(resolved_scope).to exclude(course) }
    include_context 'admin course policy context'
  end

  describe 'permitted attributes' do
    let(:attributes) do
      [:title, :description, :url, :rating,
       :owner_id, :city_id, :organization_id, :logo, tag_list: []]
    end

    it { is_expected.to permit_mass_assignment_of(attributes).for_action(:create) }
    it { is_expected.to permit_mass_assignment_of(attributes).for_action(:update) }
  end
end

require 'rails_helper'

describe CoursePolicy, 'for visitor with' do
  subject { described_class.new(user, course) }

  let(:user) { nil }
  let(:course) { create(:course) }
  let(:resolved_scope) { described_class::Scope.new(user, Course.all).resolve }

  context 'published course' do
    let(:course) { create(:course, published: true) }

    it('in resolved scope') { expect(resolved_scope).to include(course) }
    include_examples 'user policy examples', %i[index show], %i[create new update edit destroy]
  end

  context 'unpublished course' do
    it('not in resolved scope') { expect(resolved_scope).to exclude(course) }
    it { is_expected.to forbid_actions(%i[index show create new update edit destroy]) }
  end

  describe 'permitted attributes' do
    let(:attributes) do
      [:title, :description, :url, :rating,
       :owner_id, :city_id, :organization_id, :logo, tag_list: []]
    end

    it { is_expected.to forbid_mass_assignment_of(attributes).for_action(:create) }
    it { is_expected.to forbid_mass_assignment_of(attributes).for_action(:update) }
  end
end

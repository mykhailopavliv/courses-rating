require 'rails_helper'

describe CoursePolicy, 'for owner with' do
  subject { CoursePolicy.new(user, course) }

  let(:user) { create(:user) }
  let(:course) { create(:course, user: user) }
  let(:resolved_scope) { described_class::Scope.new(user, Course.all).resolve }

  context 'published course' do
    let(:course) { create(:course, owner_id: user.id, published: true) }

    it('in resolved scope') { expect(resolved_scope).to include(course) }
    it { is_expected.to permit_actions(%i[index show create new update edit destroy]) }
  end

  context 'unpublished course' do
    let(:course) { create(:course, owner_id: user.id) }

    it('not in resolved scope') { expect(resolved_scope).to exclude(course) }
    include_examples 'user policy examples', %i[create new], %i[index show update edit destroy]
  end

  describe 'permitted attributes' do
    let(:attributes) do
      [:title, :description, :url, :rating, :city_id, :organization_id, :logo, tag_list: []]
    end

    it { is_expected.to permit_mass_assignment_of(attributes << :owner_id).for_action(:create) }
    it { is_expected.to permit_mass_assignment_of(attributes).for_action(:update) }
  end
end

require 'rails_helper'
require 'support/shared_examples/admin_examples'

describe CoursePolicy do
  subject { CoursePolicy.new(user, course) }

  let(:user) { create(:user) }

  context 'published course' do
    let(:course) { create(:course, published: true) }

    context 'for a visitor' do
      let(:user) { nil }

      it { is_expected.to permit_actions(%i[index show]) }
      it { is_expected.to forbid_actions(%i[create new update edit destroy]) }
    end

    context 'for a user is not owner' do
      it { is_expected.to permit_actions(%i[index show create new]) }
      it { is_expected.to forbid_actions(%i[update edit destroy]) }
    end

    context 'for a user is owner' do
      let(:course) { create(:course, owner_id: user.id, published: true) }

      it { is_expected.to permit_actions(%i[index show create new update edit destroy]) }
    end

    context 'for a admin' do
      let(:user) { create(:user, role: 'admin') }

      it { is_expected.to permit_actions(%i[show create new update edit destroy]) }
    end
  end

  context 'unpublished course' do
    let(:course) { create(:course) }

    context 'for a visitor' do
      let(:user) { nil }

      it { is_expected.to forbid_actions(%i[index show create new update edit destroy]) }
    end

    context 'for a user is not owner' do
      it { is_expected.to permit_actions(%i[create new]) }
      it { is_expected.to forbid_actions(%i[index show update edit destroy]) }
    end

    context 'for a user is owner' do
      let(:course) { create(:course, owner_id: user.id) }

      it { is_expected.to permit_actions(%i[create new]) }
      it { is_expected.to forbid_actions(%i[index show update edit destroy]) }
    end

    context 'for a admin' do
      let(:user) { create(:user, role: 'admin') }

      include_examples 'admin examples', %i[show create new update edit destroy]
      # it { is_expected.to permit_actions(%i[show create new update edit destroy]) }
    end
  end
end

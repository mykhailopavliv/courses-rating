require 'rails_helper'

describe ReviewPolicy do
  subject { ReviewPolicy.new(user, review) }

  let(:user) { create(:user) }
  let(:review) { create(:review, course: course) }

  context 'published course' do
    let(:course) { create(:course, published: true) }

    context 'for user' do
      it { is_expected.to permit_action(:create) }
    end

    context 'for owner' do
      let(:course) { create(:course, owner_id: user.id, published: true) }

      it { is_expected.to permit_action(:create) }
      it { is_expected.to forbid_action(:destroy) }
    end

    context 'for admin' do
      let(:user) { create(:user, role: 'admin') }

      it { is_expected.to permit_actions(%i[create destroy]) }
    end
  end

  context 'unpublished course' do
    let(:course) { create(:course) }

    context 'for user' do
      it { is_expected.to forbid_actions(%i[create destroy]) }
    end

    context 'for owner' do
      let(:course) { create(:course, owner_id: user.id) }

      it { is_expected.to forbid_actions(%i[create destroy]) }
    end

    context 'for admin' do
      let(:user) { create(:user, role: 'admin') }

      it { is_expected.to permit_actions(%i[create destroy]) }
    end
  end
end

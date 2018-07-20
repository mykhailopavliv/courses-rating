require 'rails_helper'

describe CoursePolicy do
  subject { CoursePolicy.new(user, course) }

  let(:user) { create(:user) }

  context 'published course' do
    let(:course) { create(:course, published: true) }

    context 'for visitor' do
      let(:user) { nil }

      include_examples 'user policy examples', %i[index show], %i[create new update edit destroy]
    end

    include_context 'user policy context', %i[index show create new], %i[update edit destroy]
    # context 'for a user is not owner' do
    #   include_examples 'user policy examples', %i[index show create new], %i[update edit destroy]
    # end

    context 'for owner' do
      let(:course) { create(:course, owner_id: user.id, published: true) }

      it { is_expected.to permit_actions(%i[index show create new update edit destroy]) }
    end

    include_context 'admin policy context'
  end

  context 'unpublished course' do
    let(:course) { create(:course) }

    context 'for visitor' do
      let(:user) { nil }

      it { is_expected.to forbid_actions(%i[index show create new update edit destroy]) }
    end

    include_context 'user policy context', %i[create new], %i[index show update edit destroy]
    # context 'for a user is not owner' do
    #   include_examples 'user policy examples', %i[create new], %i[index show update edit destroy]
    # end

    context 'for owner' do
      let(:course) { create(:course, owner_id: user.id) }

      include_examples 'user policy examples', %i[create new], %i[index show update edit destroy]
    end

    include_context 'admin policy context'
  end
end

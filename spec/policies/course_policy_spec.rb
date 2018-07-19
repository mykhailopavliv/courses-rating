require 'rails_helper'

describe CoursePolicy do
  subject { CoursePolicy.new(user, course) }

  let(:course) { create(:course) }

  context 'for a visitor' do
    let(:user) { nil }

    it { should permit_action(:show) }

    it { should_not permit_action(:create) }
    it { should_not permit(:new) }
    it { should_not permit(:update) }
    it { should_not permit(:edit) }
    it { should_not permit(:destroy) }
  end

  context 'for a user' do
    let(:user) { create(:user) }

    it { should permit(:show) }
    it { should permit(:create) }
    it { should permit(:new) }
    it { should permit(:update) }
    it { should permit(:edit) }
    it { should permit(:destroy) }
  end
end

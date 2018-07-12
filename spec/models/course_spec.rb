require 'rails_helper'

describe Course, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:organization) }
    it { is_expected.to belong_to(:city) }
    it { is_expected.to have_many(:reviews) }
  end
end

require 'rails_helper'

describe Identity, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end
end

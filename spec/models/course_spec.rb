require 'rails_helper'

describe Course, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:organization) }
    it { is_expected.to belong_to(:city) }
    it { is_expected.to have_many(:reviews) }
  end

  let(:course) { create(:course) }

  describe 'Upload logo' do
    let(:file_full_path) { Rails.root.join('app/assets/images/pivorak logo/pivorak_logo.png') }
    let(:file_name) { 'pivorak_logo.png' }

    context 'with a valid image' do
      it 'saves the image' do
        course.logo.attach(io: File.open(file_full_path), filename: file_name)
        expect(course.logo).to be_attached
      end
    end
  end
end

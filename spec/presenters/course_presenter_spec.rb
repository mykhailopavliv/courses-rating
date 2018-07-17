require 'rails_helper'

describe CoursePresenter do
  let(:course) { create(:course) }
  let(:content_type) { 'image/png' }

  context 'has attached logo' do
    let(:file_full_path) { Rails.root.join('app/assets/images/pivorak logo/pivorak_logo.png') }
    let(:file_name) { 'pivorak_logo.png' }

    it 'attached logo when it exist' do
      course.logo.attach(
        io:           File.open(file_full_path),
        filename:     file_name,
        content_type: content_type
      )
      presenter = CoursePresenter.new(course, view)

      expect(course.logo).to be_attached
      expect(url_for(presenter.logo)).to end_with file_name
      expect(presenter.logo.content_type).to eq content_type
    end
  end

  context 'logo attachment is nil' do
    let(:default_file_name) { 'default logo/logo.png' }

    it 'default logo when logo attachment is nil' do
      presenter = CoursePresenter.new(course, view)
      expect(presenter.logo).to eq default_file_name
    end
  end
end

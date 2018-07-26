# frozen_string_literal: true

require 'rails_helper'

describe ::Courses::PendingController, type: :controller do
  let!(:course) { create_list(:course, 2, published: false) }
  let(:courses) { assigns(:courses) }
  let(:first_course_id) { course[0].id }
  let(:user) { create(:user, role: 'admin') }
  before { sign_in user }

  context 'index' do
    it 'return code 200' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'return correct number of courses' do
      get :index
      expect(courses.count).to eq(Course.unpublished.count)
    end

    it 'successfully approve course' do
      expect(Course.unpublished.count).to eq 2
      expect(Course.published.count).to eq 0
      get :change_status, params: { id: first_course_id }
      expect(Course.unpublished.count).to eq 1
      expect(Course.published.count).to eq 1
      expect(Course.find(first_course_id).published).to eq true
    end
  end
end

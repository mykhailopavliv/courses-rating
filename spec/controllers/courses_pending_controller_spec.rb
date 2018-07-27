# frozen_string_literal: true

require 'rails_helper'

describe ::Courses::PendingController, type: :controller do
  include ActiveJob::TestHelper

  let!(:course) { create_list(:course, 2, published: false) }
  let(:courses) { assigns(:courses) }
  let(:first_course_id) { course[0].id }
  let(:user) { create(:user, role: 'admin') }
  before { sign_in user }

  describe 'GET #index' do
    it 'return status code 200' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'return correct number of courses' do
      get :index
      expect(courses.count).to eq(Course.unpublished.count)
    end
  end

  describe 'GET #change_status' do
    it 'successfully approve course' do
      expect(Course.unpublished.count).to eq 2
      expect(Course.published.count).to eq 0
      get :change_status, params: { id: first_course_id }
      expect(Course.unpublished.count).to eq 1
      expect(Course.published.count).to eq 1
      expect(Course.find(first_course_id).published).to eq true
    end

    it 'send approve_email course' do
      expect do
        perform_enqueued_jobs do
          get :change_status, params: { id: first_course_id }
        end
      end.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end

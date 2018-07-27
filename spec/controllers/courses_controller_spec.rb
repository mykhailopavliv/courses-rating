# frozen_string_literal: true

require 'rails_helper'

describe CoursesController, type: :controller do
  let(:course) { create(:course, published: true) }
  let(:user) { create(:user) }

  before { sign_in user }

  context 'user make' do
    it '#index' do
      get :index
      expect(response.status).to eq(200)
    end

    it '#show' do
      get :show, params: { id: course }
      expect(response.status).to eq(200)
    end

    it '#new' do
      get :new
      expect(response.status).to eq(200)
    end

    context 'include attaching logo' do
      let(:file_full_path) { Rails.root.join('app/assets/images/pivorak logo/pivorak_logo.png') }
      let(:mime_type) { 'image/png' }
      let(:file) { fixture_file_upload(file_full_path, mime_type) }
      let(:city_id) { create(:city).id }
      let(:org_id) { create(:organization).id }
      let(:course_params) do
        {
          course: { title: Faker::StarWars.planet, city_id: city_id, organization_id: org_id,
                    logo:  file }
        }
      end

      subject(:post_create) { post :create, params: course_params }

      it '#create' do
        expect { post_create }.to change(ActiveStorage::Attachment, :count).by(1)
        expect(response.status).to eq(302)
        expect(response).to redirect_to courses_path
      end
    end
  end

  context 'owner make' do
    let(:course) { create(:course, owner_id: user.id, published: true) }

    it '#edit' do
      get :edit, params: { id: course }
      expect(response.status).to eq(200)
    end

    it '#update' do
      params = {
        title:       Faker::StarWars.planet,
        description: Faker::Lorem.paragraph
      }

      put :update, params: { id: course.id, course: params }
      course.reload
      params.keys.each do |key|
        expect(course.attributes[key.to_s]).to eq params[key]
      end
    end

    it '#destroy' do
      expect { delete :destroy, params: { id: course.id } }.to change(Course, :count).by(0)
      expect(response.status).to eq(302)
      expect(response).to redirect_to courses_path
    end
  end

  xcontext 'index action' do
    let(:courses) { create_list(:courses, 3) }

    context 'find something' do
      it 'search by title' do
        params = {
          title: courses.last.title
        }
        get :index, params: { course: params }
        expect(assigns(:courses)).to eq([courses.last])
      end

      it 'search by city' do
        params = {
          city_id: courses.last.city.id
        }
        get :index, params: { course: params }
        expect(assigns(:courses)).to eq([courses.last])
      end

      it 'search by organization' do
        params = {
          organization_id: courses.last.organization.id
        }
        get :index, params: { course: params }
        expect(assigns(:courses)).to eq([courses.last])
      end

      it 'search by tags' do
        params = {
          tag_list: courses.last.tag_list
        }
        get :index, params: { course: params }
        expect(assigns(:courses)).to eq([courses.last])
      end

      it 'search by title && city && organization && tags' do
        params = {
          title: courses.last.title,
          city_id: courses.last.city.id,
          organization_id: courses.last.organization.id,
          tag_list: courses.last.tag_list
        }
        get :index, params: { course: params }
        expect(assigns(:courses)).to eq([courses.last])
      end
    end

    context 'nothing find' do
      it 'search by frong title && city && organization && tags' do
        params = {
          title: Faker::StarWars.character,
          city_id: courses.last.city.id,
          organization_id: courses.last.organization.id,
          tag_list: courses.last.tag_list
        }
        get :index, params: { course: params }
        expect(assigns(:courses)).to eq([])
      end
    end
  end
end

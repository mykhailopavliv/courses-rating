# frozen_string_literal: true

require 'rails_helper'

describe HomeController, type: :controller do
  let(:courses) { create_list(:courses, 3) }

  context 'index action' do
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

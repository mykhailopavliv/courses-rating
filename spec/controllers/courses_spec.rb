# frozen_string_literal: true

require 'rails_helper'

describe CoursesController, type: :controller do
  let(:course) { create(:course) }

  it 'Index' do
    get :index
    expect(response.status).to eq(200)
  end

  it 'Show' do
    get :show, params: { id: course }
    expect(response.status).to eq(200)
  end

  it 'New' do
    get :new
    expect(response.status).to eq(200)
  end

  it 'Edit' do
    get :edit, params: { id: course }
    expect(response.status).to eq(200)
  end

  it 'Create' do
    post :create, params: { course: { title: Faker::StarWars.planet } }
    expect(response.status).to eq(200)
  end

  it 'Update' do
    params = {
      title: Faker::StarWars.planet,
      description: Faker::Lorem.paragraph
    }

    put :update, params: { id: course.id, course: params }
    course.reload
    params.keys.each do |key|
      expect(course.attributes[key.to_s]).to eq params[key]
    end
  end

  it 'Delete' do
    expect { delete :destroy, params: { id: course.id } }.to change(Course, :count).by(0)
    expect(response).to redirect_to root_path
  end
end

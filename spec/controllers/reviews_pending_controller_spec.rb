# frozen_string_literal: true

require 'rails_helper'

describe ::Reviews::PendingController, type: :controller do
  let!(:review) { create_list(:review, 2, published: false) }
  let(:reviews) { assigns(:reviews) }
  let(:first_review_id) { review[0].id }
  let(:user) { create(:user, role: 'admin') }
  before { sign_in user }

  context 'index' do
    it 'return code 200' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'return correct number of reviews' do
      get :index
      expect(reviews.count).to eq(Review.unpublished.count)
    end

    it 'successfully approve review' do
      expect(Review.unpublished.count).to eq 2
      expect(Review.published.count).to eq 0
      get :change_status, params: { pending_review_id: first_review_id }
      expect(Review.unpublished.count).to eq 1
      expect(Review.published.count).to eq 1
      expect(Review.find(first_review_id).published).to eq true
    end
  end
end

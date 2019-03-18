require 'rails_helper'

describe FloorsController do
  let!(:floor) { create :floor }

  describe 'GET #index' do
    it 'returns array of floors' do
      get :index

      expect(response).to have_http_status :ok
      expect(response.body).to eq [floor].to_json
    end
  end

  describe 'GET #show' do
    it 'returns floor object' do
      get :show, params: { id: floor.id }

      expect(response).to have_http_status :ok
      expect(response.body).to eq floor.to_json
    end
  end

  describe 'POST #create' do
    let(:floor) { build :floor, title: 'Test floor' }

    it 'returns floor object' do
      post :create, params: { floor: floor.as_json }

      expect(response).to have_http_status :created
      expect(JSON.parse(response.body)['title']).to eq 'Test floor'
    end
  end

  describe 'PATCH #update' do
    it 'updates record' do
      patch :update, params: { id: floor.id, floor: { title: 'Updated title' } }

      expect(response).to have_http_status :ok
      expect(floor.reload.title).to eq 'Updated title'
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes floor when it exists' do
      expect { delete(:destroy, params: { id: floor.id }) }.to change { Floor.count }.by(-1)
    end

    it 'throws 404 if floor does not exists' do
      delete :destroy, params: { id: 222 }

      expect(response).to have_http_status :not_found
    end
  end
end

require 'rails_helper'

describe BuildingsController do
  let!(:building) { create :building }

  describe 'GET #index' do
    it 'returns array of buildings' do
      get :index

      expect(response).to have_http_status :ok
      expect(response.body).to eq [building].to_json
    end
  end

  describe 'GET #show' do
    it 'returns building object' do
      get :show, params: { id: building.id }

      expect(response).to have_http_status :ok
      expect(response.body).to eq building.to_json
    end
  end

  describe 'POST #create' do
    let(:building) { build :building, name: 'Test building' }

    it 'returns building object' do
      post :create, params: { building: building.as_json }

      expect(response).to have_http_status :created
      expect(JSON.parse(response.body)['name']).to eq 'Test building'
    end
  end

  describe 'PATCH #update' do
    it 'updates record' do
      patch :update, params: { id: building.id, building: { name: 'Updated name' } }

      expect(response).to have_http_status :ok
      expect(building.reload.name).to eq 'Updated name'
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes building when it exists' do
      expect { delete(:destroy, params: { id: building.id }) }.to change { Building.count }.by(-1)
    end

    it 'throws 404 if building does not exists' do
      delete :destroy, params: { id: 222 }

      expect(response).to have_http_status :not_found
    end
  end
end

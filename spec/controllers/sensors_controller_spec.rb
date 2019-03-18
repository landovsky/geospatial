require 'rails_helper'

describe SensorsController do
  let!(:sensor) { create :sensor }

  describe 'GET #index' do
    it 'returns array of sensors' do
      get :index

      expect(response).to have_http_status :ok
      expect(response.body).to eq [sensor].to_json
    end
  end

  describe 'GET #show' do
    it 'returns sensor object' do
      get :show, params: { id: sensor.id }

      expect(response).to have_http_status :ok
      expect(response.body).to eq sensor.to_json
    end
  end

  describe 'POST #create' do
    let(:sensor) { build :sensor, sn: 'Test sensor' }

    it 'returns sensor object' do
      post :create, params: { sensor: sensor.as_json.merge(type: sensor.type) }

      expect(response).to have_http_status :created
      expect(JSON.parse(response.body)['sn']).to eq 'Test sensor'
    end
  end

  describe 'PATCH #update' do
    it 'updates record' do
      patch :update, params: { id: sensor.id, sensor: { sn: 'Updated sn' } }

      expect(response).to have_http_status :ok
      expect(sensor.reload.sn).to eq 'Updated sn'
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes sensor when it exists' do
      expect { delete(:destroy, params: { id: sensor.id }) }.to change { Sensor.count }.by(-1)
    end

    it 'throws 404 if sensor does not exists' do
      delete :destroy, params: { id: 222 }

      expect(response).to have_http_status :not_found
    end
  end
end

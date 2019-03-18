require 'rails_helper'

describe StatusController do
  describe 'GET #status' do
    it 'returns json and success' do
      get :status
      expect(response).to have_http_status(:ok)
    end
  end
end

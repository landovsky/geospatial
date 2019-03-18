require 'rails_helper'

describe Sensor do
  describe '#save' do
    it 'transforms coordinates to Postgis Point' do
      sensor = build :sensor, position: nil
      sensor.save
      expect(sensor.reload.position).not_to be_nil
    end
  end
end

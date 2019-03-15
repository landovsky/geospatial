FIXTURES = 'test/fixtures/'

params = {
  "visibility": 0,
  "working_hours": "10-18",
  "street": "Uhlířská 3, Praha",
  "phone": "+420222333090"
}
Building.create(params)

floors = JSON.parse(File.read(FIXTURES + 'floors.json'))
floors.each { |floor| puts "floor id: #{floor['id']}"; Floor.create floor }

sensors = JSON.parse(File.read(FIXTURES + 'sensors.json'))
sensors.each { |sensor| puts "sensor id: #{sensor['id']}"; Sensor.create sensor }
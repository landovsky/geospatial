FIXTURES = 'test/fixtures/'

params = {
  "visibility": 0,
  "working_hours": "10-18",
  "street": "Uhlířská 3, Praha",
  "phone": "+420222333090"
}

# the buildings data sample was not available anymore..
buildings = [26, 1, 28, 30]
buildings.each do |id|
  Building.create(params.merge(id: id))
end

floors = JSON.parse(File.read(FIXTURES + 'floors.json'))
floors.each do |floor|
  printf("floor: %s, persisted: ", floor['id'])
  f = Floor.create(floor)
  puts f.persisted?
end

sensors = JSON.parse(File.read(FIXTURES + 'sensors.json'))
sensors.each do |sensor|
  printf("sensor: %s, persisted: ", sensor['id'])
  s = Sensor.create sensor
  puts s.persisted?
end

FIXTURES = 'spec/fixtures/'.freeze

def log(entity, id, persisted)
  printf "%s id: %s, persisted: %s\n", entity, id, persisted
end

ActiveRecord::Base.connection.execute(%(
  Delete from sensors;
  DELETE FROM floors;
  DELETE FROM buildings;
))

account_tree = JSON.parse(File.read(FIXTURES + 'account-tree.json'))['account']

account_tree['buildings'].each do |building|
  import_exceptions = %w(tel_numbers b_polygon wifi_list title account_subdomain floors)
  b = Building.create(building.except(*import_exceptions))
  log :building, building[:id], b.persisted?
end

account_tree['buildings'].each do |building|
  building['floors'].each do |floor|
    import_exceptions = %w(lone_worker_zones danger_zones no_go_zones geofencing_zones shadow_zones markers
                           walls wall_items beacons nodes rooms save_points connections edges)
    f = Floor.create(floor.except(*import_exceptions))
    log :floor, floor[:id], f.persisted?
  end
end

sensors = account_tree['buildings'][0]['floors'].map { |f| f['beacons'] }.flatten

sensors.each do |sensor|
  import_exceptions = %w(stats)
  s = Sensor.create sensor.except(*import_exceptions)
  log :sensor, sensor['id'], s.persisted?
end

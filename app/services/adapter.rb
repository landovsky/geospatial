module Adapter
  module Postgis
    def self.execute(query)
      ActiveRecord::Base.connection.execute(query)
    end

    def self.encode(coordinates)
      execute(%(SELECT st_makepoint(#{coordinates[0]}, #{coordinates[1]})))
        .first['st_makepoint']
    end
  end
end

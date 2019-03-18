FactoryBot.define do
  factory :sensor do
    floor            { create :floor }
    building         { create :building }

    type             { 'Beacon::Chair' }
    coordinates      { [15.5770515319158, 10.2657958642272] }
    device_type      { 2 }
    major            { 1 }
    minor            { 1 }
    tx_power         { -57 }
    cc1310_id        { 5149013200492714 }
    sn               { "SCH0L1V100N0000001" }
    rssi             { nil }
    coordinates_wgs  { [14.4517551277795, 50.0438925966552] }
    beacon_type      { 1 }
    stone_name       { "SCH0L1V100N0000001" }
    position         { nil }
    height           { 2.0 }
  end
end

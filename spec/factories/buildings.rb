FactoryBot.define do
  factory :building do
    name                  { Faker::Restaurant.name }
    description           { nil }
    building_photo_big    { nil }
    building_photo_small  { nil }
    visibility            { 0 }
    working_hours         { "10-18" }
    street                { Faker::Address.full_address }
    phone                 { "+420222333090" }
    label                 { nil }
    building_polygon      { nil }
    deleted_at            { nil }
    order                 { 0 }
    published             { false }
    multipolygon          { nil }
  end
end

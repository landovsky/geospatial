FactoryBot.define do
  factory :floor do
    building                { create :building }

    position                { 0 }
    title                   { "adsasdasd" }
    floor_polygon           { nil }
    transformation          { nil }
    deployment_photo        { nil }
    wgs_transformation      { { "angle"=>0, "c_translation"=>[0, 0], "g_origin"=>[50.043552318694765, 14.451366998255253], "scale"=>[1, 1] } }
    ppm                     { [1.35458727551252, 1.35458727551252] }
    published               { false }
    floor                   { 1 }
    height                  { 1.0 }
    deployment_photo_width  { nil }
    deployment_photo_height { nil }
    multipolygon            { nil }
  end
end

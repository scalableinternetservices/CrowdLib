class FillLocations < ActiveRecord::Migration
  def create_new_point(rng)
    ns = 34.241943 + (rng.rand * 10 - 5)
    we = -119.889999 + (rng.rand * 5 - 2.5)
    
    { :lat => ns.to_f, :lng => we.to_f }
  end

  def change
    rng = Random.new

    3000.times do |i|
      point = create_new_point rng
      Location.create("lat" => point[:lat], "lng" => point[:lng], "name" => "Point num. #{i}")
    end
  end
end


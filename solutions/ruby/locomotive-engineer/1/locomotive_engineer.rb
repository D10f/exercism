class LocomotiveEngineer
  def self.generate_list_of_wagons(*ids)= ids

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first, second, locomotive, *rest = each_wagons_id
    return *locomotive, *missing_wagons, *rest, first, second
  end

  def self.add_missing_stops(routing, **stops)
    return {
      **routing,
      stops: stops.sort.map(&:last)
    }
  end

  def self.extend_route_information(route, more_route_information)= {**route, **more_route_information }
end

class Subway
    attr_accessor :lines

    def initialize(lines)
        @lines = lines
    end

    def stops_between_stations(start_line, start_station, end_line, end_station)
        # If the user started and ended in the same station at the same line, that means they had 0 stops
        return 0 if (start_line == end_line && start_station == end_station)
        
        # Find the stations of both start and end lines by the passed line name
        start_line_stations = @lines.find { |line| line.name == start_line }.stations
        end_line_stations = @lines.find { |line| line.name == end_line }.stations

        # # Get indices of both start and end stations to calculate stops using them
        index_of_start_station = start_line_stations.find_index { |station| station.name == start_station }
        index_of_end_station = end_line_stations.find_index { |station| station.name == end_station }

        # In the case the trip is on the same line, then the number of stops would be the direct
        # difference between both indices for start and end stations
        return (index_of_start_station - index_of_end_station).abs if(start_line == end_line)

        # The last case is if the start and end station are on different lines.
        # Since all the lines intersect at "Park Street", then we calculate the stops
        # from the first station until "Park Street" and add it to the stops from 
        # "Park Street" until the end station

        # Get the index of "Park Street" for both start and end lines
        index_of_park_street_start = start_line_stations.find_index { |station| station.name == "Park Street" }
        index_of_park_street_end = end_line_stations.find_index { |station| station.name == "Park Street" }

        # Claculate the stops from start station until "Park Street"
        stops_from_start_to_park = (index_of_start_station - index_of_park_street_start).abs
        # Claculate the stops from "Park Street" until the end station
        stops_from_park_to_end = (index_of_park_street_end - index_of_end_station).abs

        # Return the sum of stops between the two stations on different lines (Implicit return)
        stops_from_start_to_park + stops_from_park_to_end
    end
end

# One line, all the stations on that line
class Line
    attr_accessor :name, :stations

    def initialize(name, stations)
        @name = name
        @stations = stations
    end
end

# One Station
class Station
    attr_accessor :name

    def initialize(name)
        @name = name
    end
end

# Include the stations Data file
require_relative "./stations"

# Creating stations array for each line (Each array contains multiple Station objects/instances)
# The data for the names of the stations are retrived from "stations.rb" file
red_stations = StationsData.get_data[:Red].map { |station_name| Station.new(station_name) }
green_stations = StationsData.get_data[:Green].map { |station_name| Station.new(station_name) }
orange_stations = StationsData.get_data[:Orange].map { |station_name| Station.new(station_name) }

# Creating lines with their respective stations
red_line = Line.new("Red", red_stations)
green_line = Line.new("Green", green_stations)
orange_line = Line.new("Orange", orange_stations)

# Create an instance of Subway and initialize it with the lines created previusly (red, green, and orange)
mbta = Subway.new([red_line, green_line, orange_line])

# Test Cases
puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
puts mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
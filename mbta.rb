class Subway

    attr_accessor :subway_lines
  
    def initialize
      @subway_lines = {
        :red => Line.new(
          "Red", [
            "South Station",
            "Park Street",
            "Kendall",
            "Central",
            "Harvard",
            "Porter",
            "Davis",
            "Alewife"
          ]
        ),
        :green => Line.new(
          "Green", [
            "Government Center",
            "Park Street",
            "Boylston",
            "Arlington",
            "Copley",
            "Hynes",
            "Kenmore"
          ]
        ),
        :orange => Line.new(
          "Orange", [
            "North Station",
            "Haymarket",
            "Park Street",
            "State",
            "Downtown Crossing",
            "Chinatown",
            "Back Bay",
            "Forest Hills"
          ]
        )
      }
    end
  
    def stops_between_stations(start_line, start_station, end_line, end_station)
  
      start_line = start_line.downcase.to_sym
      end_line   = end_line.downcase.to_sym
  
      start_station_index = @subway_lines[start_line].stations.index do |station|
        station.name.downcase == start_station.downcase
      end
  
      end_station_index = @subway_lines[end_line].stations.index do |station|
        station.name.downcase == end_station.downcase
      end
  
      if (start_line != end_line)
  
        start_line_park_street_index = @subway_lines[start_line].stations.index do |station|
          station.name == "Park Street"
        end
  
        end_line_park_street_index = @subway_lines[end_line].stations.index do |station|
          station.name == "Park Street"
        end
  
        stops_until_park_street = (start_station_index - start_line_park_street_index).abs
        stops_until_destination = (end_station_index - end_line_park_street_index).abs
        total_stops = stops_until_park_street + stops_until_destination
        p total_stops
  
      else
  
        total_stops = (start_station_index - end_station_index).abs
        p total_stops
      end
  
    end
  
  end
  
  # One line, all the stations on that line
  class Line
  
    attr_accessor :name, :stations
  
    def initialize(name, stations)
      @name     = name
      @stations = stations.map do |station|
        Station.new(station)
      end
    end
  end
  
  # One station
  class Station
  
    attr_accessor :name
  
    def initialize(name)
      @name = name
    end
  end
  mbta = Subway.new
  mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
  mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
  mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
    
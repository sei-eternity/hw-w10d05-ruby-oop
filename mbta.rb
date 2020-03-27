class Subway
    def stops_between_stations(start_line, start_station, end_line, end_station)
    end
  end
    
  # One line, all the stations on that line
  class Line
    def initialize(name,stations)
        @line_name = name
        @station_array =stations
     end
     def prent_stations
        @station_array.each{|station| 
    puts station.prent_name}
     end
  end
  
  # One station
  class Station
    def initialize(name)
        @station_name = name
     end
     def prent_name
        return @station_name
     end
  end

#   south_station= Station.new("South Station")
#   park_street= Station.new("Park Street")
#   kendall= Station.new("Kendall")
#   central= Station.new("Central")
#   harvard=Station.new("Harvard")
#   porter=Station.new("Porter")
#   davis=Station.new("Davis")
#   alewife=Station.new("Alewife")
  red_array=[Station.new("South Station"),
  Station.new("Park Street"),
  Station.new("Kendall"),
  Station.new("Central"),
  Station.new("Harvard"),
  Station.new("Porter"),
  Station.new("Davis"),
  Station.new("Alewife")]

  green_array=[Station.new("Government Center"),
  Station.new("Park Street"),
  Station.new("Boylston"),
  Station.new("Arlington"),
  Station.new("Copley"),
  Station.new("Hynes"),
  Station.new("Kenmore")]

  orange_array=[Station.new("North Station"),
  Station.new("Haymarket"),
  Station.new("Park Street"),
  Station.new("State"),
  Station.new("Downtown Crossing"),
  Station.new("Chinatown"),
  Station.new("Back Bay"),
  Station.new("Forest Hills")]

  

  subway_lines = {
          Red: Line.new("Red",red_array),
          Green: Line.new("Green",green_array),
          Orange: Line.new("Orange",orange_array)
  }
  subway_lines[:Red].prent_stations
  subway_lines[:Green].prent_stations
  subway_lines[:Orange].prent_stations
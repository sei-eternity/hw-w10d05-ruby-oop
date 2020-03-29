class Subway
    attr_accessor :lines

    def initialize

    subway_line= {
Red: [
   "South Station",
   "Park Street",
   "Kendall",
   "Central",
   "Harvard",
   "Porter",
   "Davis",
   "Alewife"
   ],
Green: [
   "Government Center",
   "Park Street",
   "Boylston",
   "Arlington",
   "Copley",
   "Hynes",
   "Kenmore"
],

Orange: [
    "North Station",
    "Haymarket",
    "Park Street",
    "State",
    "Downwn Crossing",
    "Chinatown",
    "Back Bay",
    "Forest Hills"
]  
   }
   red_line = Line.new("Red",red)
   green_line = Line.new("Green",green)
   orange_line = Line.new("Orange",orange)

   @lines = [red_line, green_line, orange_line]

def stops_between_stations (start_line , start_station , end_line , end_station)

    start_station_x = subway_line[start_line].index(start_station)
    end_station_x = subway_line[end_line].index(end_station)

    if start_line === end_line
         (start_station_x - end_station_x ).abs

    else

park_startY= subway_line[start_line].index("Park Street")
park_endY= subway_line[end_line].index("Park Street")

stops_to_park = (start_station_x - park_startY ).abs
stop_from_park = (park_endY -  end_station_x ).abs

totsl_stops= stops_to_park + stop_from_park
end
end
end


class Line
    attr_accessor :name, :stations
    def initialize(name, stations)
        @name = name
        @stations = stations.map { |station| Station.new(station)}
    end
end


class Station
    attr_accessor :station_name
    def initialize(station_name)
      @station_name = station_name
    end
  end
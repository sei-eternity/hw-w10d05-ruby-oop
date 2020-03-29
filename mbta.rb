class Subway
    attr_accessor :source_of_routes

    def initialize 

    # add all the routs 
    @source_of_routes= {
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
     "State",
     "Park Street",
     "Chinatown",
     "Downwn Crossing",
     "Back Bay",
     "Forest Hills"
        ]
    }

    end

  def stops_between_stations(start_line, start_station, end_line, end_station)

    @start_line = Line.new(start_line , start_station)

    @start_station= Station.new(start_station)

    @end_line= Line.new(end_line, end_station)
    
    @end_station = Station.new(end_station) 

    # count the index of start and end station using "index" method  
    start_station_index = @source_of_routes[@start_line.line.to_sym].index(@start_station.station)
    
    end_station_index = @source_of_routes[@end_line.line.to_sym].index(@end_station.station)

    # condition to test if the start line and end line are the same 
    if @start_line.line == @end_line.line
    return p (start_station_index - end_station_index).abs
    end

    # identify start of park index 
    park_start_index = @source_of_routes[@start_line.line.to_sym].index("Park Street")

    # identify end of park index 
    park_end_index  = @source_of_routes[@end_line.line.to_sym].index("Park Street")

    # calculate the number of stops to park 
    stops_to_park = (start_station_index - park_start_index).abs

    # calculate the number of stops from park 
    stops_from_park = (park_end_index - end_station_index).abs

    # calculate the total number of stops by park 
    total_stops_by_park = stops_to_park + stops_from_park

    return  p total_stops_by_park
    end

  
 end
  
# One line, all the stations on that line
class Line < Subway
    attr_accessor :line , :station
  
    def initialize(line, station)
        @line = line 
         @station = Station.new(station)
      end
    end


# One station
class Station < Line
    attr_accessor :station
  
    def initialize(station)
        @station = station
    end
end


 
    

mbta = Subway.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
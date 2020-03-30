class Subway
    attr_accessor :lines ,:stops;
    def initialize 
        @lines={
            Red: ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"],
            Green: ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"],
            Orange: ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"]
        }
        @stops= 0 
    end 
    
    def stops_between_stations(start_line, start_station, end_line, end_station)

    # Make a new instance from Class Line. @lines[start_line.to_sym] are the all stations on that line(array)
        @line_start= Line.new(start_line, @lines[start_line.to_sym])
      
        @line_end = Line.new(end_line, @lines[end_line.to_sym])

    #  find the index of each station by find index method . The stations come from Class Line
        start_station_index= @line_start.stations.find_index { |station| station.name == start_station }
        end_station_index=  @line_end.stations.find_index { |station| station.name == end_station }
        park_street_start_station_index= @line_start.stations.find_index { |station| station.name == 'Park Street' }
        park_street_end_station_index=   @line_end.stations.find_index { |station| station.name == 'Park Street' }
        
        
        if start_line == end_line
            stops = ( start_station_index -  end_station_index).abs

           
        else 
            stops =  (start_station_index - park_street_start_station_index).abs
            stops += ( end_station_index -   park_street_end_station_index ).abs 
 
        end
        p " #{stops} stops "


    end 
end

    
  # One line, all the stations on that line
  class Line
    attr_accessor :line , :stations ;

    def initialize ( line , stations)
    @line = line
    # map over the stations to make an instance of each statation from Class station 
    @stations = stations.map { |station_name| Station.new(station_name) } 
    end
end 
  
  # One station
  class Station 
    attr_accessor :name ;
        def initialize (name)
            @name=name
        end
    end 




mbta = Subway.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
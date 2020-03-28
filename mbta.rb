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

        @start_line = Line.new(start_line, start_station)
        @start_station = Station.new(start_station)
        @end_line = Line.new(end_line, end_station)
        @end_station = Station.new(end_station)

        if start_line == end_line
            stops = (lines[start_line.to_sym].index(start_station) - lines[end_line.to_sym].index(end_station) ).abs

           
        else 
            stops =  (lines[start_line.to_sym].index(start_station) - lines[start_line.to_sym].index('Park Street') ).abs
            stops += (lines[end_line.to_sym].index(end_station) -  lines[end_line.to_sym].index('Park Street') ).abs 
 
        end
        p " #{stops} stops "


    end 
end

    
  # One line, all the stations on that line
  class Line
    attr_accessor :line , :station ;

    def initialize ( line , station)
    @line = line
    @station=Station.new(station)
    end
end 
  
  # One station
  class Station 
    attr_accessor :station  ;
        def initialize (station)
            @station=station
        end
    end 




mbta = Subway.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
class Subway
    attr_accessor :lines ,:stops;
    def initialize
        @lines={
            Red: ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"],
            Green: ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"],
            Orange: ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"]
        }
        @stops=0 ;
    end

    def stops_between_stations(line_start,start_station,line_end,stop_station)

        # calling from another calss to difine variabels. 
        # Subway will cal Line and Staion and take the values from them (more like import )
    @line_start = Line.new(line_start, start_station)
    @line_end = Line.new(line_end , stop_station)
    @start_station = Station.new(start_station)
    @stop_station = Station.new(stop_station)

        if line_start == line_end
            stops = (lines[line_start.to_sym].index(start_station) - lines[line_end.to_sym].index(stop_station) ).abs
        
           elsif line_start != line_end
            stops =  (lines[line_start.to_sym].index(start_station) - lines[line_start.to_sym].index('Park Street') ).abs
            stops += (lines[line_end.to_sym].index(stop_station) -  lines[line_end.to_sym].index('Park Street') ).abs 
        
           end
           puts " #{stops} Stops "

    end
end


class Line 
attr_accessor :line , :station ;

    def initialize ( line , station)
    @line = line
    @station=Station.new(station)
    end
end 

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





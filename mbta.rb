class Subway
    attr_accessor :subway_lines; 
    def initialize

     @subway_lines = { 
        Red: 
        ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"],
                
        Green: 
        ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"],
                
        Orange:
        ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"]
        }
        
    end

    def stops_between_stations(start_line, start_station, end_line, end_station)
       
        index_of_start_station = subway_lines[start_line.to_sym].index(start_station)
        index_end_station = subway_lines[end_line.to_sym].index(end_station)

        if start_line == end_line 
            count =  (index_end_station - index_of_start_station).abs   
        else 
            count =  ((subway_lines[start_line.to_sym].index('Park Street') - index_of_start_station)).abs
             count  +=  ((index_end_station - subway_lines[end_line.to_sym].index('Park Street'))).abs
        end
    end
end

# One line, all the stations on that line
class Line 
     attr_accessor :subway_lines, :stations; 
      def initialize(subway_lines,stations)
        @subway_lines=subway_lines
        @stations=stations
      end
end

# One station
class Station 
    attr_accessor :station;
    def initialize(station)
      @station=station
    end
end


 mbta = Subway.new
p mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') 
p mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') 
p mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') 



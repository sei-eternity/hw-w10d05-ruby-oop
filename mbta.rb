class Subway
    attr_accessor :subway_lines 
    def initialize
     @subway_lines = { 
       Red:["South Station","Park Street", "Kendall","Central",
           "Harvard","Porter", "Davis", "Alewife"],
        Green:["Government Center", "Park Street", "Boylston",
           "Arlington","Copley","Hynes","Kenmore" ],
        Orange:["North Station", "Haymarket", "Park Street","State",
           "Downtown Crossing","Chinatown",  "Back Bay", "Forest Hills"]
    }
    end

    def stops_between_stations(start_line, start_station, end_line, end_station)

        first_station = subway_lines[start_line.to_sym].index(start_station)

        final_station = subway_lines[end_line.to_sym].index(end_station)

    if (start_line == end_line)
      (first_station - final_station).abs
     
    else

     first_line = subway_lines[start_line.to_sym].index('Park Street')

     park1 = (first_station - first_line).abs

    final_line = subway_lines[end_line.to_sym].index('Park Street')

    park2 =(final_line - final_station).abs

    stops = park1 + park2
  end
end
end


class Line < Subway
     attr_accessor :stations, :subway_lines 
      def initialize(subway_lines,stations)
        @stations=stations
        @subway_lines=subway_lines
      end
      
end

class Station < Subway
    attr_accessor :station
    def initialize(station)
      @station=station
    end
end


 mbta = Subway.new
p mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
p mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
p mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') #6


p "Enter line of your station"
    start_line = gets.chomp
p "Enter your current station"
    start_station = gets.chomp
    
p "Enter end line of your station"
    end_line = gets.chomp
p "Enter your last station "
    end_station = gets.chomp
    
p  mbta.stops_between_stations(start_line, start_station, end_line, end_station)
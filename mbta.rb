class Subway

    attr_accessor :lines

    def initialize
     @lines = { "Red" => Line.new( "Red", ["South Station","Park Street", "Kendall","Central",
           "Harvard","Porter", "Davis", "Alewife"]),
       "Green" => Line.new("Green", ["Government Center", "Park Street", "Boylston",
           "Arlington","Copley","Hynes","Kenmore" ]),
       "Orange" => Line.new("Orange", ["North Station", "Haymarket", "Park Street","State",
           "Downtown Crossing","Chinatown",  "Back Bay", "Forest Hills"])
     }
   end

    def stops_between_stations(start_line, start_station, end_line, end_station)

      
       start_index = @lines[start_line].stations.index do |station|
       station.name== start_station
     end

      end_index = @lines[end_line].stations.index do |station|
       station.name.downcase == end_station.downcase
     end


     if start_index  ==  end_index 

        count = (end_index - start_index).abs

     else 
        park_street_start_line = @lines[start_line].stations.index do |station|
            station.name == "Park Street"
          end
        park_street_end_line = @lines[end_line].stations.index do |station|
            station.name == "Park Street"
      end

      to_park_station_start = (start_index - park_street_start_line).abs
      to_park_station_end = (end_index - park_street_end_line).abs
      count = to_park_station_start + to_park_station_end

     end 

     end 
    
    end 

     # One line, all the stations on that line
class Line

    attr_accessor :name
    attr_accessor :stations
    def initialize(name, stations)
     @name = name
     @stations = stations.map { |station_name| Station.new(station_name) }
     
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
 puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
 puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
 puts mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
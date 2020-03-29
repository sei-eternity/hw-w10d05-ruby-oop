class Subway
    attr_accessor :lines
    attr_accessor :count_stops
    
    def initialize
    @stops=0
    @lines = {
        "Red" => [
          "South Station",
          "Park Street",
          "Kendall",
          "Central",
          "Harvard",
          "Porter",
          "Davis",
          "Alewife"
        ],
        "Green" => [
          "Government Center",
          "Park Street",
          "Boylston",
          "Arlington",
          "Copley",
          "Hynes",
          "Kenmore"
        ],
        "Orange" => [
          "North Station",
          "Haymarket",
          "Park Street",
          "State",
          "Downtown Crossing",
          "Chinatown",
          "Back Bay",
          "Forest Hills"
        ]
      }
    end


    def stops_between_stations (stLine, stStation, endLine, endStation)

          if stLine === endLine 
            @stops = (lines[stLine].find_index(stStation) - lines[endLine].find_index(endStation)).abs()
            p @stops 
         end
          if stLine != endLine
            @stops = (lines[stLine].find_index(stStation) - lines[stLine].find_index("Park Street")).abs()
            @stops += (lines[endLine].find_index(endStation) - lines[endLine].find_index("Park Street")).abs()
            p @stops
          end
    
    end
        end 


class Station 
    attr_accessor :station  ;
        def initialize (station)
            @station = station
        end
    end 

    
class Line 
    attr_accessor :line
    attr_accessor :station

        def initialize ( line , station)
        @line = line
        @station = Station.new(station)
        end
    end 
    

    mbta = Subway.new
    mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
    mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
    mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
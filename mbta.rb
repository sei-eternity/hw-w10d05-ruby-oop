class Subway
    attr_accessor :lines
    def initialize
    @lines ={
        "Red"=>[
                "South Station",
                "Park Street",
                "Kendall",
                "Central",
                "Harvard",
                "Porter",
                "Davis",
                "Alewife"
            ],
            "Green"=> [
                "Government Center",
                "Park Street",
                "Boylston",
                "Arlington",
                "Copley",
                "Hynes",
                "Kenmore"
            ],
            "Orange"=> [
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

    def stops_between_stations(start_line, start_station, end_line, end_station)
       # decler varibal stops
    stops = 0;
      # write the condation for equal or not 
    if start_line === end_line
        stops = (lines[start_line].find_index(start_station) - lines[end_line].find_index(end_station)).abs()
        puts stops
    end 
    if start_line != end_line
        stops = (lines[start_line].find_index(start_station) - lines[end_line].find_index("Park Street")).abs()
        stops += (lines[end_line].find_index(end_station) - lines[end_line].find_index("Park Street")).abs()
        puts stops
    end 
end
  end
    
  # One line, all the stations on that line
  class Line < Subway
  end
  
  # One station
  class Station <Subway
  end





mbta = Subway.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
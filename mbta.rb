class Subway
    def stops_between_stations(startline, startsation, endline, endstation)
  
          sat = Station.new
         if(startline == endline)
             sat.line_st(startline,endline,startsation,endstation)
          else
            sat.line_st(startline,endline,startsation,endstation)
            
         end
    end
  end
    
  # One line, all the stations on that line
  class Line
    def lines
      train = {
        Red:['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter', 'Davis', 'Alewife'],
        Green:['Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore'],
        Orange:['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
    }
    end
  end
  
  # One station
  class Station < Line
      def line_st(linest,line_end,st_station,end_station)
        stops = 0
        startingIndex = lines[linest.to_sym].index(st_station)
        endingIndex = lines[line_end.to_sym].index(end_station)
        p stops = (startingIndex - endingIndex).abs
      end
  end
  mbta = Subway.new
  mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
  mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
  mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
  
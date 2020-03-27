class Subway 
   
    def initialize
        @subway_lines = {
            Red: Line.new("Red",[Station.new("South Station"),
            Station.new("Park Street"),
            Station.new("Kendall"),
            Station.new("Central"),
            Station.new("Harvard"),
            Station.new("Porter"),
            Station.new("Davis"),
            Station.new("Alewife")]),
            Green: Line.new("Green",[Station.new("Government Center"),
            Station.new("Park Street"),
            Station.new("Boylston"),
            Station.new("Arlington"),
            Station.new("Copley"),
            Station.new("Hynes"),
            Station.new("Kenmore")]),
            Orange: Line.new("Orange",[Station.new("North Station"),
            Station.new("Haymarket"),
            Station.new("Park Street"),
            Station.new("State"),
            Station.new("Downtown Crossing"),
            Station.new("Chinatown"),
            Station.new("Back Bay"),
            Station.new("Forest Hills")])
    }
end
     
    def stops_between_stations(start_line, start_station, end_line, end_station)
        if start_line==end_line
            # if the user in same line
            if start_station==end_station
                # if the user in same station

               return  puts 0
            end
            #Else but stell in same Line  
            #Prent the number of satation by sub stations index
            return puts( @subway_lines[start_line.to_sym].prent_stations.index(start_station)- @subway_lines[start_line.to_sym].prent_stations.index(end_station).abs)
            
         end
         #Else so satation not in same line as we know Park Street is intersection point
         return puts (@subway_lines[start_line.to_sym].prent_stations.index(start_station) - @subway_lines[start_line.to_sym].prent_stations.index("Park Street")).abs + (@subway_lines[end_line.to_sym].prent_stations.index("Park Street") - @subway_lines[end_line.to_sym].prent_stations.index(end_station)).abs
         
    end
  end
    
  # One line, all the stations on that line
  class Line
    def initialize(name,stations)
        @line_name = name
        @station_array =stations
     end
     def prent_stations
        
     @station_array.map{|station| 
     station.prent_name}
    
     end
  end
  
  # One station
  class Station
    def initialize(name)
        @station_name = name
     end
     def prent_name
        return @station_name
     end
  end

#   south_station= Station.new("South Station")
#   park_street= Station.new("Park Street")
#   kendall= Station.new("Kendall")
#   central= Station.new("Central")
#   harvard=Station.new("Harvard")
#   porter=Station.new("Porter")
#   davis=Station.new("Davis")
#   alewife=Station.new("Alewife")
#   red_array=[Station.new("South Station"),
#   Station.new("Park Street"),
#   Station.new("Kendall"),
#   Station.new("Central"),
#   Station.new("Harvard"),
#   Station.new("Porter"),
#   Station.new("Davis"),
#   Station.new("Alewife")]

#   green_array=[Station.new("Government Center"),
#   Station.new("Park Street"),
#   Station.new("Boylston"),
#   Station.new("Arlington"),
#   Station.new("Copley"),
#   Station.new("Hynes"),
#   Station.new("Kenmore")]

#   orange_array=[Station.new("North Station"),
#   Station.new("Haymarket"),
#   Station.new("Park Street"),
#   Station.new("State"),
#   Station.new("Downtown Crossing"),
#   Station.new("Chinatown"),
#   Station.new("Back Bay"),
#   Station.new("Forest Hills")]

  

#   subway_lines = {
#           Red: Line.new("Red",red_array),
#           Green: Line.new("Green",green_array),
#           Orange: Line.new("Orange",orange_array)
#   }
#   subway_lines[:Red].prent_stations
#   subway_lines[:Green].prent_stations
#   subway_lines[:Orange].prent_stations
  puts "+++++++++++++"
  mbta = Subway.new
  mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
  mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
  mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
class Subway
    attr_accessor :lines, :count_stops

    def initialize
        @count_stops = 0 #to count the stops
        @lines = [] #store all stations 
        @start_line_stations = [] # store only stations for firs_line 
        @end_line_stations = []# store only stations for end_line 
    end

    def stops_between_stations(start_line, start_station, end_line, end_station)
        subway_line= {
            Red:["South Station","Park Street","Kendall","Central","Harvard","Porter","Davis","Alewife"],
            Green:["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"],
            Orange:["North Station","Haymarket","Park Street","State","Downtown Crossing","Chinatown","Back Bay","Forest Hills"]
            }
        # case if same station
        if start_station == end_station
            count_stops = 0 

        # case if same line
        elsif start_line == end_line 
            subway_line.map do |key,line|
                val_key = key.to_s # take the key 

                if val_key == start_line #if key and start line is same
                  if line.index(start_station) < line.index(end_station) 
                     line[line.index(start_station)..line.index(end_station)].map do |station|
                       if station != end_station
                        @count_stops += 1 
                        lines.push(station) 
                        @start_line_stations.push(station)
                       end
                     end
                     break 

                    else
                        line[line.index(end_station)..line.index(start_station)].map do |station|
                            if station != start_station #if key not equal start line is same
                                @count_stops +=1
                                @start_line_stations.push(station)
                                lines.push(station)
                               end
                        end
                   end
                end
            end
            # case if not equal start,end line
        elsif start_line != end_line
            subway_line.map do |key,line|
                val_key = key.to_s 

                if val_key == start_line 
                    if line.index(start_station) < line.index("Park Street") # here there is intersection between lines

                        line[line.index(start_station)..line.index("Park Street")].map do |station|

                            if station != "Park Street"
                             @count_stops+=1
                             lines.push(station)
                             @start_line_stations.push(station)
                             else
                                @start_line_stations.push("Park Street")
                              break  
                            end

                          end

                    else
                        line[line.index("Park Street")..line.index(start_station)].map do |station|

                            if station != start_station
                             @count_stops+=1
                             lines.push(station)
                             @start_line_stations.push(station)
                             else
                                @start_line_stations.unshift("Park Street")
                              break  
                            end
                          end
                    end

                elsif val_key == end_line 

                    if line.index(end_station) < line.index("Park Street")

                        line[line.index(end_station)..line.index("Park Street")].map do |station|
                            if station != "Park Street"
                             @count_stops+=1
                             lines.push(station)
                             @end_line_stations.push(station) 
                             else
                                @end_line_stations.push(end_station) 
                              break  
                            end
                          end

                     else

                        line[line.index("Park Street")..line.index(end_station)].map do |station|
                            
                            if station != end_station
                             @count_stops+=1
                             lines.push(station)
                             @end_line_stations.push(station) 
                             else
                                @end_line_stations.unshift(end_station)
                              break  
                            end
                          end
                    end
                end
            end
        end

# ---------Bonus-----------
        p "You must travel through the following stops on the #{start_line}:"
        @start_line_stations.map do |item| 
            print "#{item}, "
        end
        if !@end_line_stations.empty?
          p "Change at Park Street."
          p "our trip continues through the following stops on #{end_line}: "
          @end_line_stations.map do |item| 
           print "#{item}, "
          end
        end
        p "#{@count_stops} stops in total." 
    end

end # end subway class



# One line, all the stations on that line
class Line < Subway

  attr_reader :stations, :name
   def initialize(name, stations)
    @stations = lines 
    @name = name
   end

end # end line class




# One station
class Station < Line

        attr_reader :name
        def initialize(name)
          @name = name
        end

end# end station class




mbta = Subway.new
# mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
# mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
# mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6


# ---------Double Bonus-----------

# puts "plz input your start line"
# start_line=gets.chomp

# puts "plz input your start station"
# start_station=gets.chomp

# puts "plz input your  end line"
# end_line=gets.chomp

# puts "plz input your end station"
# end_station=gets.chomp

# mbta.stops_between_stations(start_line,start_station,end_line,end_station)
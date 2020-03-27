class Subway
    attr_accessor :lins;
    def initialize
        @lines={
            Red: ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"],
            Green: ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"],
            Orange: ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"]
        }
    end

    def stops_between_stations(start_line, start_station, end_line, end_station)
        @start_line = Line.new(start_line, start_station)
        @end_line = Line.new(end_line, end_station)
        @start_station = Station.new(start_station)
        @end_station = Station.new(end_station)
        
        @start_station_index = @lines[@start_line.line.to_sym].index(@start_station.station)
        @end_station_index = @lines[@end_line.line.to_sym].index(@end_station.station)
        @first_transaction_index =  @lines[@start_line.line.to_sym].index('Park Street')
        @second_transaction_index =  @lines[@end_line.line.to_sym].index('Park Street')

        if (@start_line.line == @end_line.line)
            result = (@start_station_index - @end_station_index).abs

            return  "#{result} stops in total"
        end

        @first_station = (@start_station_index - @first_transaction_index).abs
        @second_station = (@end_station_index - @second_transaction_index).abs

        return  "#{@first_station + @second_station} stops in total"
    end
end  
# One line, all the stations on that line
class Line
    attr_accessor :line, :station;
    def initialize(line, station)
        @line = line
        @station = Station.new(station)
    end
end

# One station
class Station
    attr_accessor :station;
    def initialize(station)
        @station = station
    end
end

mbta = Subway.new

#============================ Double Bonus ============================#
p "Please inter the first line  : " 
start_line =  gets.chomp
p "Please inter the first station : " 
start_station =  gets.chomp
p "Please inter the last line : " 
end_line =  gets.chomp
p "Please inter the last station : " 
end_station =  gets.chomp
puts mbta. stops_between_stations(start_line, start_station, end_line, end_station)
#============================ test resource ============================#
puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife')#0
puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station')#7
puts mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore')#6

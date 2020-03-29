class Subway
    attr_accessor :lines
    attr_accessor :stops_of_start_line
    attr_accessor :stops_of_end_line

    def initialize(lines)
        @lines = lines
        @stops_of_start_line = []
        @stops_of_end_line = []
    end

    def stops_between_stations(start_line, start_station, end_line, end_station)

        # Extract start and end lines' stations from :lines
        start_line_stations = (lines.detect { |line| line.name.downcase.eql?(start_line.downcase)}).stations
        end_line_stations = (lines.detect { |line| line.name.downcase.eql?(end_line.downcase)}).stations

        
        # Get index of both start and end stations
        start_station_index = start_line_stations.find_index { |station| station.name.downcase == start_station.downcase}
        end_station_index = end_line_stations.find_index{ |station| station.name.downcase == end_station.downcase}


        # If the start && end stations match >> same line 
        if(start_line.downcase.eql?(end_line.downcase))

            num_of_stops = stops_of_same_line(start_line_stations, start_station_index, end_station_index)

            puts "You must travel through the following stops on the #{start_line} line:"
            print_stops(stops_of_start_line)

            puts "#{num_of_stops} stops in total."

        else # Different lines!
            num_of_stops = stops_of_different_lines(start_line_stations, start_station_index, end_line_stations, end_station_index)

            puts "You must travel through the following stops on the #{start_line} Line:"
            print_stops(stops_of_start_line)
            puts "Change at Park Street."
            puts "Your trip continues through the following stops on #{end_line} Line:"
            print_stops(stops_of_end_line)
            puts "#{num_of_stops} stops in total."
        end

    end

    def stops_of_same_line(line_stations, start_station_index, end_station_index)
        # if the start station equals the end stations >> no stops!
        if(start_station_index == end_station_index)
            # push the station to the stations array to be printed
            stops_of_start_line.push(line_stations[start_station_index])
            return 0

        else 
            # copy the start station index as an iterator because we don't want to change the original value
            i = start_station_index
            # loop until the iterator reaches the end index
            until i == end_station_index
                # in each iteration push the station to the stations array to be printed later 
                stops_of_start_line.push(line_stations[i])

                # if the start station index is less than the end station index (start station comes first in the array)
                if(start_station_index < end_station_index)
                    # increment the iterator
                    i += 1
                else 
                    # otherwise decrement the iterator
                    i -= 1
                end
            end

            # I can get number of stops by directly calculating the difference of the two indexes
            return (start_station_index - end_station_index).abs
        end
    end

    def stops_of_different_lines(start_line_stations, start_station_index, end_line_stations, end_station_index)
        # In this case I will have to get park street index of both lines
        park_st_index_in_start_line = start_line_stations.find_index { |station| station.name == 'Park Street'}
        park_st_index_in_end_line = end_line_stations.find_index { |station| station.name == 'Park Street'}
    

        # copy the start station index as an iterator for the start line because we don't want to change the original value
        i = start_station_index

        # loop in the start line until the iterator reaches the park street index in the start line
        until i == park_st_index_in_start_line
            stops_of_start_line.push(start_line_stations[i])

            # if the start station index is less than park street index (start station comes first in the array)
            if(start_station_index < park_st_index_in_start_line)
                # increment the iterator
                i += 1
            else 
                # otherwise decrement the iterator
                i -= 1
            end
        end
        # Push park street station
        stops_of_start_line.push(start_line_stations[i])


        # copy the end station index as an iterator for the second line because we don't want to change the original value
        j = end_station_index

        # loop in the end line until the iterator reaches park street index in the end line
        until j == park_st_index_in_start_line
            stops_of_end_line.push(end_line_stations[j])

            # if the end station index is less than park street index (end station comes first in the array)
            if(end_station_index < park_st_index_in_start_line)
                # increment the iterator
                j += 1
            else 
                # otherwise decrement the iterator
                j -= 1
            end
        end

        # Get the number of stops of the start and end lines by calculating the absolute value of the difference between start and end stations
        start_stops = (park_st_index_in_start_line - start_station_index).abs
        end_stops = (park_st_index_in_end_line - end_station_index).abs


        # if the end station index is larger than park street index (end station comes after in the array) reverse the array so it will be printed in the exact order!
        if(end_station_index > park_st_index_in_start_line)
            stops_of_end_line.reverse!
        end

        # Return total number of stops by summing the start stops & end stops + park street station
        return start_stops + end_stops + 1
    end

    def print_stops(stops)
        # print the stops
        delimiter = ', '
        all_stops = ""
        stops.each do |station|
            delimiter = ' and ' unless stops.index(station) != stops.length-2
            delimiter = '.' unless stops.index(station) != stops.length-1

            all_stops = "#{all_stops}#{station.name}#{delimiter}"
        end
        puts all_stops
    end

end
    
  # One line, all the stations on that line
  class Line
    attr_accessor :name
    attr_accessor :stations
    def initialize(name, stations)
        @name = name
        @stations = stations
    end
  end
  
  # One station
  class Station
    attr_accessor :name
    def initialize(name)
        @name = name
    end
  end


# Creating an object for each station from Class Station 
red_stations = %w(South\ Station Park\ Street Kendall Central Harvard Porter Davis Alewife).map{ |station| Station.new(station) }
green_stations = %w(Government\ Center Park\ Street Boylston Arlington Copley Hynes Kenmore).map{ |station| Station.new(station) }
orange_stations = %w(North\ Station Haymarket Park\ Street State Downtown\ Crossing Chinatown Back\ Bay Forest\ Hills).map{ |station| Station.new(station) }

# Creating line objects by passing the name of the line and its stations from class Station
red_line = Line.new('Red', red_stations)
green_line = Line.new('Green', green_stations)
orange_line = Line.new('Orange', orange_stations)

# Combine the three lines into one array
lines = [red_line, green_line, orange_line]

# Create a subway object and pass the lines to the class
mbta = Subway.new(lines)


# Test cases
# mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
# mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
# mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
# mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') 

# Get user inputs
# get user inputs
puts "Enter the start line:"
start_line = gets.chomp
puts "Enter the start station:"
start_station = gets.chomp
puts "Enter the end line:"
end_line = gets.chomp
puts "Enter the end station:"
end_station = gets.chomp

# pass the inputs as arguments to the method
mbta.stops_between_stations(start_line, start_station, end_line, end_station)
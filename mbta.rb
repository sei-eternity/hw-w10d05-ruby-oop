class Subway
    attr_accessor :lines
  
    def initialize
  
      red = ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter', 'Davis','Alewife']
      green =['Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes','Kenmore']
      orange =['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']

      red_line = Line.new("Red",red)
      green_line = Line.new("Green",green)
      orange_line = Line.new("Orange",orange)

      @lines = [red_line, green_line, orange_line]
    end

    def stops_between_stations(start_line, start_station, end_line, end_station)
        start_line = find_line(start_line)
        start_station=start_line.find_station (start_station)
        end_line = find_line(end_line)
        end_station=end_line.find_station (end_station)
  
        results = 0
       puts "#{start_line.line_name} #{start_station} #{end_line.line_name} #{end_station}"
      puts "Rider boards the train a #{start_line.line_name} Line and #{start_station}."
      if start_line === end_line
          results = one_line_stops(start_line, start_station, end_station)
      else 
          results = one_line_stops(start_line, start_station, "Park Street")
          puts "Rider transfers from #{start_line.line_name} Line to #{end_line.line_name} Line at Park Street."
          results += one_line_stops(end_line, "Park Street", end_station)
      end
      puts "Rider exits the train a #{end_line.line_name} Line and #{end_station}."
      puts "#{results} stops in total!"
     end

     def find_line(line_name)
        self.lines.find do |line| 
           line.line_name == line_name
         end
       end
   
       def one_line_stops(line, start_station, end_station) 
   
         start_index = line.find_station_index(start_station)
         end_index = line.find_station_index(end_station)
         i = start_index +1
         counter = 0
        if start_index < end_index 
            loop do 
             puts "Rider arrives at #{line.line_name} Line and #{line.find_station_by_index(i)}"
             i=i+1
                counter= counter+1
               #  puts counter
                break if i > end_index
            end

        elsif  start_index > end_index 
            i = start_index -1
          loop do 
            puts "Rider arrives at #{line.line_name} Line and #{line.find_station_by_index(i)}"
            i=i-1
           counter= counter+1
           break if i < end_index
          end
          end
       return counter 
      end
  end


  
  class Line
    attr_accessor :line_name, :stations
  
    def initialize (line_name , stations)
      @line_name = line_name
        @stations = stations.map do |station|
             Station.new (station)
        end
        # p @stations
  
    end
  
    def find_station(station_name)
  
       s = self.stations.find do |station| 
         station.station_name == station_name
       end
       s.station_name
  
     end
     def find_station_by_index(station_index)
      self.stations[station_index].station_name
     end
     def find_station_index(station_name)
  
      self.stations.index(station_name)
      i = self.stations.find do |station| 
        station.station_name == station_name
      end
       i = self.stations.index(i)
     end
  
  end
  
  # One station
  class Station
    attr_accessor :station_name
    def initialize(station_name)
      @station_name = station_name
        # puts station_name
    end
  end
  
  mbta = Subway.new 
  mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
  mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
  mbta.stops_between_stations('Red','South Station', 'Red', 'Alewife' ) # 7
  mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
  mbta.stops_between_stations('Orange', 'Forest Hills', 'Green', 'Kenmore')  #10
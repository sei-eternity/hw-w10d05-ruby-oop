class Subway
    attr_accessor :Red
    attr_accessor :Green
    attr_accessor :Orange

    def initialize
        @Red =    "South Station", "Park Street","Kendall", "Central","Harvard", "Porter", "Davis","Alewife"
        @Green =    "Government Center", "Park Street","Boylston", "Arlington","Copley", "Hynes","Kenmore"
        @Orange =   "North Station", "Haymarket","Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"
    end
    def stops_between_stations(start_line, start_station, end_line, end_station)
          stops = 0

          tracking = []
          # to get start and end distantion
          start_distantion = instance_variable_get("@#{start_line}").index(start_station)
          end_distantion = instance_variable_get("@#{end_line}").index(end_station)
          # to get park index
          park_start = instance_variable_get("@#{start_line}").index("Park Street")
          park_end = instance_variable_get("@#{end_line}").index("Park Street")
          if start_line == end_line
          stops = (instance_variable_get("@#{start_line}").index(start_station) - instance_variable_get("@#{end_line}").index(end_station)).abs
         
          if end_distantion > start_distantion
          tracking  = instance_variable_get("@#{start_line}")[start_distantion..end_distantion]
          else
          tracking  = instance_variable_get("@#{start_line}")[end_distantion..start_distantion]
          end
        
          puts "You're in #{tracking.join(" ,next station ")}, Welcome you arrived to your distantion"
          puts "total #{stops} stops"
          else
        
         
          stops = (instance_variable_get("@#{start_line}").index(start_station) - instance_variable_get("@#{start_line}").index("Park Street")).abs
          stops += (instance_variable_get("@#{end_line}").index(end_station) - instance_variable_get("@#{end_line}").index("Park Street")).abs
    
        
          tracking  = instance_variable_get("@#{start_line}")[start_distantion..park_start] + instance_variable_get("@#{end_line}")[park_end..end_distantion]
          
        tracking = tracking.uniq
          puts "You're in #{tracking.join(" ,going to ")}, Welcome you arrived to your distantion"
          puts "total #{stops} stops"
          end
    end
  end
    
  # One line, all the stations on that line
  class Line < Subway
        def initialize
            super()
        end
        def show_lines
          puts " Availables lines Red, Grean, Orange lines"
        end
  end
  
  # One station
  class Station < Subway
    def initialize
        super()
    end

    def one_station(one_line)
        stations = instance_variable_get("@#{one_line}")
        puts " #{one_line} line are #{stations.join(" ,")}"

    end

  end


mbta = Subway.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
p "==============================="
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
p "==============================="
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
p "==============================="

line = Line.new
line.show_lines

p "==============================="
station = Station.new
station.one_station('Red')


class Subway
    def initialize
      @line = {
        'Green' => ['Haymarket', 'Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore'],
        'Red' => ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter', 'Davis', 'Alewife'],
        'Orange' => ['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
      }
    end
  
    def stops_between_stations(start_line, start_station, end_line, end_station)
      @start_line = start_line
      @start_station = start_station
      @end_line = end_line
      @end_station = end_station
      @start_park_street = @line[start_line].index('Park Street')
      @end_park_street = @line[end_line].index('Park Street')
      @start_trip = (@line[start_line].index(start_station) - @start_park_street).abs
      @ending_point = @line[end_line].index(end_station)

      if start_line == end_line
        (@line[start_line].index(start_station) - @line[end_line].index(end_station)).abs
      else
        @start_trip + (@ending_point - @end_park_street).abs
      end
    end
  end
  
  class Line
    attr_reader :name, :stations
    def initialize(name, stations)
      @name = name
      @stations = stations
    end
  end
  class Station
    @name = name
    attr_reader :name
    def initialize(name)
      @name = name
    end
  end
  MBTA = Subway.new
  puts MBTA.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') #0
  puts MBTA.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') #7
  puts MBTA.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') #6 
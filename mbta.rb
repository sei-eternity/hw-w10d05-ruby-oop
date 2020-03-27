class Subway
  attr_reader :SUBWAY_MAP_LINES

  def initialize
    @SUBWAY_MAP_LINES = {
        Red: Line.new(%w<South\ Station Park\ Street Kendall Central Harvard Porter Davis Alewife>.map { |s| Station.new(s) }),
        Green: Line.new(%w<Government\ Center Park\ Street Boylston Arlington Copley Hynes Kenmore>.map { |s| Station.new(s) }),
        Orange: Line.new(%w<North\ Station Haymarket Park\ Street State Downtown\ Crossing Chinatown Back\ Bay Forest Hills>.map { |s| Station.new(s) }),
    }
  end

  def stop_at_one_station(line, first_station, second_station)
    line = line.to_sym 
    (@SUBWAY_MAP_LINES[line].line.index { |s| s.station == first_station } - @SUBWAY_MAP_LINES[line].line.index { |s| s.station == second_station }).abs
  end
  
  def stops_between_stations(start_line, start_station, end_line, end_station)
    if start_line == end_line
      p stop_at_one_station(start_line, start_station, end_station)
    else
      intersection_point = "Park Street"
      p stop_at_one_station(start_line, start_station, intersection_point) + stop_at_one_station(end_line, intersection_point, end_station)
    end
  end
end

# One line, all the stations on that line
class Line
  attr_reader :line

  def initialize(line)
    @line = line
  end

  def station(station)
    @line.index { |s| s.station == station }
  end

end

# One stations
class Station
    attr_reader :station

    def initialize(station)
    @station = station
  end
end


mbta = Subway.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6


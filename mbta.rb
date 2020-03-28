class Subway
  attr_reader :subway_line
  def initialize
  @subway_line= {
 
  
    Red: ["South Station","Park Street","Kendall","Central","Harvard","Porter","Davis","Alewife"],
    Green: ["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"],
    Orange: ["North Station","Haymarket","Park Street","State","Downwn Crossing","Chinatown", "Back Bay","Forest Hills"]
}

end
    def stops_between_stations(start_line, start_station, end_line, end_station)
      @start_line =Line.new(start_line , start_station)
       @start_station= Station.new(start_station)
        @end_line= Line.new(end_line, end_station)
         @end_station = Station.new(end_station) 

      start_station_index = @subway_line[@start_line.line.to_sym].index(@start_station.station)
      end_station_index = @subway_line[@end_line.line.to_sym].index(@end_station.station)
      
      if @start_line.line == @end_line.line 
         return (start_station_index - end_station_index).abs
      end
    
      park_start_index = @subway_line[@start_line.line.to_sym].index("Park Street")
      park_end_index  = @subway_line[@end_line.line.to_sym].index("Park Street")

      stops_to_park = (start_station_index - park_start_index).abs
      stops_from_park = (park_end_index - end_station_index).abs

      total_stops_via_park = stops_to_park + stops_from_park
      
      return total_stops_via_park
    end
  end
    
  # One line, all the stations on that line
  class Line < Subway

  attr_accessor :line , :station

    def initialize(line,station)
      @line=line
      @station = Station.new(station)
    end

  end
  
  # One station
  class Station < Line
    attr_accessor :station

    def initialize(station)
     @station = station
    end

  end

  mbta = Subway.new
p mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
p mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
p mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
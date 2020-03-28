class Subway
  
  attr_accessor :lines

  def initialize()
    @red = Line.new("Red",["South Station","Park Street","Kendall","Central","Harvard","Porter","Davis","Alewife"])
    @green = Line.new("Green",["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"])
    @orange = Line.new("Orange",["North Station","Haymarket","Park Street","State","Downtown Crossing","Chinatown","Back Bay","Forest Hills"])
  
    red_name = @red.name.to_sym
    green_name = @green.name.to_sym
    orange_name = @orange.name.to_sym

    @lines = {
        red_name => @red,
        green_name => @green,
        orange_name => @orange
   }

  end 
    def stops_between_stations(start_line, start_station, end_line, end_station) 

      start_linee = start_line.to_sym 
      end_linee = end_line.to_sym
    
      stop = 0;
  
     startingPoint =@lines[start_linee].stations.index do |station|
      station.name == start_station
     end
     
     parkStarting = @lines[start_linee].stations.index do |station|
      station.name == 'Park Street'
     end

     endingPoint = @lines[end_linee].stations.index do |station|
      station.name == end_station
     end

    parkending = @lines[end_linee].stations.index do |station|
      station.name == 'Park Street'
     end

  
      if (start_line == end_line) 
              result = (startingPoint.to_i - endingPoint.to_i).abs
              stop = stop.to_i + result.to_i
      elsif (start_line != end_line) 
               finalStart =(startingPoint.to_i - parkStarting.to_i).abs
               finalEnd =(endingPoint.to_i - parkending.to_i).abs
              stop = finalStart.to_i + finalEnd.to_i
       end
  p stop
    end

end
    

  # One line, all the stations on that line
  class Line
    attr_accessor :name, :stations
  
    def initialize(name,stations)
      @name = name
      @stations = stations.map do |station|
        Station.new(station)
      end 
    end


  end
  

  # One station
  class Station
    attr_accessor :name
  
    def initialize(name)
      @name = name
     end

  end


 mbta = Subway.new
 p mbta.lines
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
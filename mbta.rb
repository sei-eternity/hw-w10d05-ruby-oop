class Mbta
  def initialize
  @lines = {
  "Red"=>["South Station", "Park Street","Kendall","Central","Harvard","Porter","Davis","Alewife"],
  "Green"=> ["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"],
  "Orange"=> ['North Station',"Haymarket","Park Street","State","Downtown Crossing","Chinatown","Back Bay","Forest Hills"]
}
  end
  def stops_in_same_station(first_stop,last_stop,line)
  first_location = @lines[line].index(first_stop)
  last_location = @lines[line].index(last_stop)
  stops = (first_location - last_location)
  end
end
class Lines < Mbta
def stops_in_diffirent_statoins(first_station,first_stop, last_station, last_stop) 

    station1 = stops_in_same_station(first_stop,"Park Street", first_station)
    station2 = stops_in_same_station('Park Street',last_stop, last_station)

  total= station1 + station2
  puts "#{total}"

end
end
class Stations < Lines
  def initialize
    @lines = {
  "Red"=>["South Station", "Park Street","Kendall","Central","Harvard","Porter","Davis","Alewife"],
  "Green"=> ["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"],
  "Orange"=> ['North Station',"Haymarket","Park Street","State","Downtown Crossing","Chinatown","Back Bay","Forest Hills"]
}
  end
  def stops_between_stations(first_station,first_stop, last_station, last_stop)

  if first_station == last_station
    distance = stops_in_same_station(first_stop, last_stop, first_station)
      puts "#{distance}"
  else 
    stops_in_diffirent_statoins(first_station,first_stop, last_station, last_stop)
  end
end
end
mbta = Stations.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') 
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') 
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') 
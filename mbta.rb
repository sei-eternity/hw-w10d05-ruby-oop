class Subway

attr_accessor :count_stops
#################################################################################

def initialize
@count_stops=0

end
 #################################################################################   

def stops_between_stations(start_line, start_station, end_line, end_station)
    subway_line= {
    Red:["South Station","Park Street","Kendall","Central","Harvard","Porter","Davis","Alewife"],
    Green:["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"],
    Orange:["North Station","Haymarket","Park Street","State","Downtown Crossing","Chinatown","Back Bay","Forest Hills"]
    }
##################################################################################################################################################################
        # same station 0 Stops 
        if start_station==end_station
            @count_stops=0 
#################################################################################
        elsif start_line == end_line # same line
        subway_line.map do |key,line|
        val_key=key.to_s
        if val_key == start_line 
        if line.index(start_station) < line.index(end_station) #
        line[line.index(start_station)..line.index(end_station)].map do |station|
        if station != end_station
        @count_stops+=1 
        end
        end
        break 
        else
        line[line.index(end_station)..line.index(start_station)].map do |station|
        if station != start_station
         @count_stops+=1
        end
        end
        end
        end
        end
 ##################################################################################################
    # start_line not equal end_line
    elsif start_line != end_line
    subway_line.map do |key,line|
    val_key=key.to_s # take the key 
    if val_key == start_line  #if key and start line is same
    @count_stops=line.index("Park Street") -line.index(start_station)
     
    elsif val_key == end_line #if key and end_line is same
    @count_stops+=(line.index("Park Street") -line.index(end_station)).abs
    end
    end
    end
    puts "#{@count_stops} stops in total." # stops count
    end
    end 
##################################################################################################
mbta = Subway.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
#################################################################################
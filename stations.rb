# Data for all stations and the line they belong to
class StationsData
    def self.get_data
        lines = {
            Red: [
                "South Station",
                "Park Street",
                "Kendall",
                "Central",
                "Harvard",
                "Porter",
                "Davis",
                "Alewife"
            ],
            Green: [
                "Government Center",
                "Park Street",
                "Boylston",
                "Arlington",
                "Copley",
                "Hynes",
                "Kenmore"
            ],
            Orange: [
                "North Station",
                "Haymarket",
                "Park Street",
                "State",
                "Downtown Crossing",
                "Chinatown",
                "Back Bay",
                "Forest Hills"
            ]
        }

        # return lines hash
        lines
    end
end
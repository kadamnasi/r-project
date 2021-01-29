library(lubridate)

stations <- list("Shawbury"= "Site_643",
                 "Leuchars"= "Site_235", 
                 "Aldergrove"="Site_1450",
                 "Heathrow"="Site_708",
                 "Benson"="Site_613", 
                 "Boulmer"="Site_315", 
                 "Northolt"="Site_709",
                 "Blackpool"="Site_1090",
                 "Ringway"="Site_1135", 
                 "Waddington"="Site_384",
                 "Hawarden Airport"="Site_1144", 
                 "Sumburgh"="Site_4",
                 "Marham"="Site_409", 
                 "Tain Range"="Site_79", 
                 "Hurn"="Site_842", 
                 "Pembrey Sands"="Site_1226",
                 "Machrihanish"="Site_908", 
                 "Yeovilton"="Site_1302", 
                 "Dyce"="Site_161", 
                 "Abbotsinch"="Site_971")

aggregation_plot_choices <- list("Hourly Data" ='hour',
                                 "Daily Mean" = 'daily_mean',
                                 "Monthly Mean"='monthly_mean',
                                 "Daily maxima"='daily_maxima',
                                 "Daily minima"= 'daily_minima')

weather_varibales_choices <- list("Wind Speed" = "wind_speed", 
                                  "Air Temperature" = "air_temperature", 
                                  "Relative Humidity" ="rltv_hum",
                                  "Visibility" ="visibility")

x_axis_choices <- list("Continous Daily"= ymd_hms('ob_time'),
                       "Aggregated by Day"= 'day',
                       "Time"='hour')

data_dir <- "C:/Users/michael/Desktop/1pylearning/r_project/Data"
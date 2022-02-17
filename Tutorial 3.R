install.packages(c("dplyr","ggplot2"))
install.packages("lubridate")
library(dplyr)
library(ggplot2)
library(lubridate)
climate_change$Date <- ymd(climate_change$Day)
plot(climate_change$Date, climate_change$temperature_anomaly)
US <- annual_co_emissions_by_region[annual_co_emissions_by_region$Entity == "United States", ]
ME <- annual_co_emissions_by_region[annual_co_emissions_by_region$Entity == "Mexico", ]
CA <- annual_co_emissions_by_region[annual_co_emissions_by_region$Entity == "Canada", ]
plot(US$Year, US$`Annual CO2 emissions (zero filled)`)
plot(ME$Year, ME$`Annual CO2 emissions (zero filled)`)
plot(CA$Year, CA$`Annual CO2 emissions (zero filled)`, main = "North America Annual 'CO'[2] Emission")
points(US$Year, US$`Annual CO2 emissions (zero filled)`, col = "cyan")
points(ME$Year, ME$`Annual CO2 emissions (zero filled)`, col = "magenta")
ggplot(data=climate_change[climate_change$Entity != "World", ], aes(x = Date,
                                y = temperature_anomaly,
                                color = Entity))+
  geom_line
colnames(annual_co_emissions_by_region)
colnames(annual_co_emissions_by_region)[4] <- "CO2"
datCO2 <- c(annual_co_emissions_by_region)
ggplot(data=datCO2[datCO2$Entity == "United States", datCO2$Entity == "Mexico", datCO2$Entity == "Canada", ], aes(x = Year,
                                                                                                                  y = CO2,
                                                                                                                  color = Entity))+
                                                                                                                  
                                                                                                                                                                                                              
  geom_line()

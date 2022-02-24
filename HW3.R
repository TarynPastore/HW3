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
datCO2 <- annual_co_emissions_by_region
ggplot(data=datCO2[datCO2$Entity == "United States"|
                     datCO2$Entity == "Mexico"|
                     datCO2$Entity == "Canada", ], aes(x = Year,
                                                   y = CO2,
                                                   color = Entity))+
  labs(color = "Country")+
                                                                                                                  
                                                                                                                                                                                                              
  geom_line()


#HomeWork


#Question 1

ggplot(data=datCO2[datCO2$Entity == "United States"|
                     datCO2$Entity == "China", ], aes(x = Year,
                                                       y = CO2,
                                                       color = Entity))+
  labs(color = "Country")+
  coord_cartesian(xlim = c(1850, 2020))+
  labs(y = "Carbon Emissions",
  title = "Annual Carbon Emissions from China and US")+
  
  
  
  geom_line()

#Question 2
fit <- lm(Date ~ temperature_anomaly, data = climate_change) 
ggplot(data=climate_change[climate_change$Entity == "World", ], aes(x = Date,
                                                      y = temperature_anomaly))+
                                                         
 
  labs(y = "Temperature Anomaly",
       title = "Temperature Anomalies in the World",
       caption = "World temperature anomalies are shown in the black line graph.
The blue line represents the regression of temperature
anomalies and gives a sense of the average change in
temperature anomalies over time.")+
  stat_summary(fun.data=mean_cl_normal) + 
  geom_smooth(method='lm')+
  geom_line()
  
ggplot(data=datCO2[datCO2$Entity == "World", ], aes(x = Year,
                                                    y = CO2))+
                                                  
  
  coord_cartesian(xlim = c(1880, 2020))+
  labs(y = "Carbon Emissions",
       title = "Total Carbon Emissions in the World",
       caption = "Total World Carbon Emissions are shown in the black line graph.
The blue line represents the regression of carbon emissions and gives a sense of the average change in
carbon emission over time.")+
  stat_summary(fun.data=mean_cl_normal) + 
  geom_smooth(method='lm')+
  geom_line()  


#Question 3
colnames(coal_production_by_country)[4] <- "Coal_TWh"
ggplot(data=coal_production_by_country[coal_production_by_country$Entity == "United States"|
                                         coal_production_by_country$Entity == "India"|
                                         coal_production_by_country$Entity == "Germany"|
                                         coal_production_by_country$Entity == "United Kingdom"|
                                       coal_production_by_country$Entity == "Japan"|
                                         coal_production_by_country$Entity == "China", ], aes(x = Year,
                                                      y = Coal_TWh,
                                                      color = Entity))+
  labs(color = "Country")+
  labs(y = "Coal Production (TWh)",
       title = "Coal Production (TWh) in Top Coal Producing Countries")+
  geom_line()
  
  
 
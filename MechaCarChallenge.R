# Load dplyr
library(dplyr)
# Import and Read .csv file
mpg_results <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_results) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_results)) #generate summary statistics

# Import and Read Suspension Coil .CSV
Susp_coil_results <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F)
total_summary <- Susp_coil_results %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table with multiple columns
lot_summary <- Susp_coil_results %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table with multiple columns

#T-test comparing sample(all lots) to pop.
t.test((Susp_coil_results$PSI),mu=1500)
#Subset T-test
lot1 <- subset(Susp_coil_results, Susp_coil_results$Manufacturing_Lot == "Lot1")
t.test((lot1$PSI), mu = 1500)

lot2 <- subset(Susp_coil_results, Susp_coil_results$Manufacturing_Lot == "Lot2")
t.test((lot2$PSI), mu = 1500)

lot3 <- subset(Susp_coil_results, Susp_coil_results$Manufacturing_Lot == "Lot3")
t.test((lot3$PSI), mu = 1500)

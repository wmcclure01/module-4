## Wayne McClure Module 4 LIS 4370 2/1/2022
#begin by adding in the libraries I think I'll need for the assignment
library(ggplot2)
library(tidyverse)
library(readxl)
library(reshape2)

#import the excel file
sample_data <- read_excel("C:\\Users\\Admin\\OneDrive\\Documents\\USF Information\\Spring 2022\\LIS 4370 R Programming\\Home4Data.xlsx")
#to show the histograms I want to groupby the Patients

sample2 <- sample_data
sample2['Patient_Num'] <- seq(1,10)

#subset just the columns I want
subset_sample2 <- sample2[, -c(1:2)]

#melt to make the data long
melted <- melt(subset_sample2, "Patient_Num")

#build the histogram
ggplot(melted, aes(x=value , y=Patient_Num , fill = variable)) + geom_bar(stat = 'identity', position = 'stack')

##Box plot build out
boxplot(BP~Frequency, data= sample2, notch = FALSE, col = "darkgreen")


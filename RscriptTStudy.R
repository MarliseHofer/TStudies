#set working directory
setwd("~/Dropbox/research/Role of Smell in Stress Reduction/dominance communication between men/TStudiesR")

#The data 
data <- read.csv("t_study1.csv", header=TRUE)

#graphs
library(tidyverse)
library(ggplot2)

#with normal variables
data %>% 
	ggplot(aes(x = avg_ple, y = test)) + 
	geom_point() +
	geom_smooth(color = "purple", lwd = 1, se=TRUE)

cor.test(data$avg_ple, data$test)

#correlation - r=0.035  p=.036

#exact same with zscored varibales
data %>% 
	ggplot(aes(x = Zavg_ple, y = Ztest)) + 
	geom_point() +
	geom_smooth(color = "purple", lwd = 1, se=TRUE)

#pleasantness has one variable with zscore of over 3
#filter out that variable
data %>% 
	filter (shirt_code != "31") %>% 
	ggplot(aes(x = Zavg_ple, y = Ztest)) + 
	geom_point() +
	geom_smooth(color = "purple", lwd = 1, se=TRUE)

data1 <- filter (data, shirt_code != "31")
cor.test(data1$Zavg_ple, data1$Ztest)

#correlation is stronger - r=0.039 p=.021

#also take out clean shirt
data2 <- filter (data, shirt_code != "31", shirt_code != "37")
cor.test(data2$Zavg_ple, data2$Ztest)

#correlation - r=0.035 p = .044

#okay, now I'll look at graphs from dominance and prestige with test
data %>% 
	ggplot(aes(x = Zavg_dom, y = Ztest)) + 
	geom_point() +
	geom_smooth(color = "purple", lwd = 1, se=TRUE)

data %>% 
	ggplot(aes(x = Zavg_pre, y = Ztest)) + 
	geom_point() +
	geom_smooth(color = "purple", lwd = 1, se=TRUE)

#okay, now I'll look at graphs from dominance and prestige with plesantness

data %>% 
	ggplot(aes(x = Zavg_dom, y = Zavg_ple)) + 
	geom_point() +
	geom_smooth(color = "purple", lwd = 1, se=TRUE)

cor.test(data$Zavg_ple, data$Zavg_dom)

# correlation r=0.56  p=.0004

#take out the outlier in dom
data %>% 
	filter (shirt_code != "7")  %>% 
	ggplot(aes(x = Zavg_dom, y = Zavg_ple)) + 
	geom_point() +
	geom_smooth(color = "purple", lwd = 1, se=TRUE)

data3 <- filter (data, shirt_code != "7")
cor.test(data3$Zavg_ple, data3$Zavg_dom)

# correlation r=0.45  p=.006

data %>% 
	ggplot(aes(x = Zavg_pre, y = Zavg_ple)) + 
	geom_point() +
	geom_smooth(color = "purple", lwd = 1, se=TRUE)

cor.test(data$Zavg_ple, data$Zavg_pre)
# correlation r=0.93

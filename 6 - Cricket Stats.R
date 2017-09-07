# 1. Get data from http://stats.espncricinfo.com/ci/content/records/284248.html and work on the questions
#
# Plot 5 highest runs across the year
# 2. Find highest number of times a player had become the highest run scorer in a calendar year
# 3. Plot contribution of player country in becoming highest run getters EX: Australian players 20%
#

library("xml2")
library("rvest")
link = "http://stats.espncricinfo.com/ci/content/records/284248.html"
file=read_html(link)

df=html_nodes(file,"table")

df_table<-html_table(df[1],fill=TRUE)
View(df_table)
df.final <- as.data.frame(df_table)

View(df.final)

# Step 2 - Plot top 5 Runs scorers

Five<- c(df.final$Player[1], df.final$Player[2], df.final$Player[3], df.final$Player[4], df.final$Player[5])

TopFive.df <- NULL
TopFive.df$Runs<- df.final$Runs[1:5]
TopFive.df$Year<- df.final$Year[1:5]

plot(TopFive.df$Year, TopFive.df$Runs)

#End
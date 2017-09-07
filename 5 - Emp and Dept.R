# Q1. Combine the datasets Emp and Dept and create a dataframe which has department name & loocation along
# with employee information
# Q2. Find the average salary by location
# Q3. Create a dataset which has name of employee along with their manager name and find the manager who
# has the most direct reportees
# Q4. Salary increments are as follows - ANALYST - 15%, CLERK  -12.5%, MANAGER - 10.20%, PRESIDENT - 5.70%, SALESMAN - 13.30%
# Calculate the salaries after the increment

install.packages("gdata")

library("gdata")

getwd()
setwd("/Users/sinu/MICA/Studies/Study Material/Term 4/AMMA/Data/data_2017")
employees = read.csv("Emp.csv")
dept = read.csv("Dept.csv")

final.df = merge(employees, dept)

#Step 2 - Finding average salary by location

avg_sal_loc = aggregate(df$SAL, by = list(df$LOC), data = df, mean)
View(avg_sal_loc)

#Step 3 - Finding the manager with the most reportees

mgr = subset(df, select = c(3, 5))
View(mgr)

# Step 4 - Convert into factors to find frequency of each level
mgr$MGR <- as.factor(mgr$MGR)
rp = plyr::count(mgr, 'MGR')
View(rp)
print(rp[which.max(rp[,2]),])
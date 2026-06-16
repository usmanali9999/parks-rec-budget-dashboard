install.packages("dplyr")
install.packages("ggplot2")

# Load the libraries (run this every time you open RStudio)
library(dplyr)
library(ggplot2)

# Read your CSV data file
df <- read.csv("C:\\Users\\Adnan LapTop House\\Downloads\\parks_and_rec_budget.csv")

# BAR CHARTS 

df %>%
  group_by(Department) %>%
  summarise(Total_Budget = sum(Budget_in_Thousands)) %>%
  ggplot(aes(x = reorder(Department, -Total_Budget), y = Total_Budget, fill = Department)) +
  geom_bar(stat = "identity") +
  ggtitle("Total Budget by Department") +
  theme(axis.text.x = element_text(angle = 45,, hjust = 1))


# LINE CHARTS

df %>%
  group_by(Year) %>%
  summarise(Annual_Budget = sum(Budget_in_Thousands)) %>%
  ggplot(aes(x = Year, y = Annual_Budget)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "darkblue", size = 2) +
  ylab("Annual Budget") +
  theme_minimal()
  

 #Break out by Departments
  df %>%
    ggplot(aes(x = Year, y = Budget_in_Thousands, color = Department)) +
    geom_line(linewidth = 1.2) + # Makes the lines thicker and easier to see
    ggtitle("Annual Budget per Department") +
    theme_minimal() 
  

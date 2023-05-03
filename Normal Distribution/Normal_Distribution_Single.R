# Import the ggplot library
library(ggplot2)

# Read the csv files into variables, considering the first line as headers
data_0 <- read.table('/Users/ribeiro/r-graphs/Normal Distribution/cve-distribution-Global.csv', header = TRUE)

# Pass the global dataset in the data argument to avoid cutting values in the graph
plot <- ggplot(data_0, aes(Total)) + 
  stat_function(fun = dnorm,                 # Specify the distribution type
                args = list(
                  mean = mean(data_0$Total), # Calculate the mean of the dataset
                  sd = sd(data_0$Total)      # Calculate the standard deviation of the dataset
                ),
                aes(colour = "Global"),      # Set the name for the legend
                size = 1                     # Set the thickness of the line
              ) +
  scale_colour_manual("",                    # Set the legend name
                      breaks = c("Global"),  # Set the legend order
                      values = c("#40826d")  # Set the colors for the lines
                      )

# Add text to X and Y axis, and define the plot theme
plot <- plot + scale_x_continuous(name = "Number of CVEs") + 
  scale_y_continuous(name = "Density") + theme_bw()

# Save the plot as a pdf file
ggsave("normal_distribution_single.pdf")

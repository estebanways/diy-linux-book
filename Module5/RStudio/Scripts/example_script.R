# This is a simple R script

# Load a dataset (you can replace this with your own data)
data <- c(25, 30, 35, 40, 45, 50, 55, 60, 65, 70)

# Calculate the mean and standard deviation
mean_value <- mean(data)
sd_value <- sd(data)

# Print the mean and standard deviation
cat("Mean:", mean_value, "\n")
cat("Standard Deviation:", sd_value, "\n")

# Create a histogram to visualize the data
hist(data, main = "Histogram of Data", xlab = "values", ylab = "Frequency", col = "lightblue")


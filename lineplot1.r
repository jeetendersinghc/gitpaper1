# new_graph.R
# Create a simple scatter plot using ggplot2

# Load the library
library(ggplot2)

# Create a small dataset
data <- data.frame(
  x = 1:10,
  y = (1:10)^1.5
)

# Generate the plot
ggplot(data, aes(x, y)) +
  geom_point(color = "blue", size = 3) +
  geom_line(color = "red", linewidth = 1) +
  labs(
    title = "Simple Scatter Plot (Developer A - Final)",
    x = "X Values",
    y = "Y Values"
  ) +
  theme_minimal()

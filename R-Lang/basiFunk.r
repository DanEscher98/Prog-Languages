mult <- function(n) {
    2 * n
}

# Elements are arranged sequentially by row.
m <- matrix(c(3:14), nrow = 4, byrow = TRUE)
print(m)

# Elements are arranged sequentially by column.
n <- matrix(c(3:14), nrow = 4, byrow = FALSE)
print(n)

# Define the column and row names.
rownames <- c("row1", "row2", "row3", "row4")
colnames <- c("col1", "col2", "col3")

p <- matrix(c(3:14), nrow = 4, byrow = TRUE,
            dimnames = list(rownames, colnames))
print(p)

library(ggplot2)
ggplot(data = iris,
       mapping = aes(
                     x = Species,
                     y = Sepal.Length)) + geom_boxplot()

ggsave("first.png")

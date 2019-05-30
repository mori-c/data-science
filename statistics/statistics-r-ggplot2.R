## https://github.com/UofTCoders/paper-rcourse
## https://github.com/UofTCoders/Events/issues/237

## ggplot2 functions to plot
## ctrl + enter = runs multple lines

5 + 5

## see email instructions
install.packages('ggplot2')
## import
library(ggplot2)

## load dataset gently
head(diamonds)

## make subset data, obj called d
d <- head(diamonds, n = 1000)

## start with ggplot(dataframe arguments)
## aesthetics = axis relationships (x, y)
## add + at the end of the line  
## geom_point() = scatter plot with points
ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point()

## 1st line: ^^ function on top +
## 2nd line: plot

## ---------------------------------------------------------------------------

## save ggplot as an object
p <- ggplot(diamonds, aes(x = carat, y = price))

## same as line 24
## reduce opacity of points, 0 to 1 (solid)
## alpha == transparency point
p + 
  geom_point(alpha = 0.5)  ## alpha [0, 1]


## alter setttings
## explain via categorical measures by add aes color = column name
ggplot(diamonds, aes(x = carat, y = price, color = cut)) + 
  geom_point()

ggplot(diamonds, aes(x = carat, y = price, color = clarity)) + 
  geom_point()

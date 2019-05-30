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

## IF & I1 diamonds = outiners of cluster lines (not really similar to PCA = principal component analysis)
## be geom-point specific
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) + 
  ## localize aesthetics
  geom_point(aes(color = clarity))


## HISTOGRAM
## ---------------------------------------------------------------------------
## no y
## split into 30 equal size bins
ggplot(diamonds, aes(x = carat)) + 
  geom_histogram(binwidth = 0.01)  ## split size


## BOXPLOT
## ---------------------------------------------------------------------------
ggplot(diamonds, aes(x = clarity, y = carat)) +
  geom_boxplot()

## fit in linear or quadradtic fits into a single functions
## back to origin plot
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +  ## global setting
  geom_point(alpha = 0.5) +
  ## linear regression 
  geom_smooth(method = 'lm')  ## will guess wrong in its fit, specify method == lm = linear model


## LINE FITS
## ---------------------------------------------------------------------------
## return one single linear fit
ggplot(diamonds, aes(x = carat, y = price)) +  ## global setting
  geom_point(aes(color = clarity)) +
  ## linear regression 
  geom_smooth(method = 'lm', color = 'red') 


## PRETTIFY THEMES
## ---------------------------------------------------------------------------
p <- ggplot(diamonds, aes(x = carat, y = price)) +  ## global setting
  geom_point(aes(color = clarity)) +
  ## linear regression 
  geom_smooth(method = 'lm', color = 'red') 


p + theme_bw()         # cuts something out
p + theme_classic()    # minimal


## customize your own theme
## ggplot lesson's bottom page Resource Section
p + theme()




## FACETING
## ---------------------------------------------------------------------------
## Split from level of categorical subjects

ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point(aes(color = clarity)) +     ## gives each plot window a different color
  ## categorical (tilda ~ variable 01)
  facet_wrap(~ clarity)  ## shows muktple plots based on category

## 2 Variables on x and y axis
ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point() +
  facet_grid(cut ~ clarity) +
  theme_minimal()







## ---------------------------------------------------------------------------


## NOTES

## order of geom_point's matter, like z-index layers in css
## factor variable gives order level
## scale family function that selects the order of axis transformation

## HELPER
?geom_smooth


## Theme resources:
## R Graph Gallery, ggpubr (publication match themer)

##  geom_smooth(method = 'lm', color = 'red') = strings
##  arguments regarding columns don't express in strings, but if it's other features, then it'll need ''
##  dplyr functions similar as well
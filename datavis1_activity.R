#### Load packages ####
install.packages("ggplot2")
library(ggplot2)

#### Read in data ####
#We will be using one of the example datasets that is provided with R. 
data(iris)

#Use head to look at the first few rows of the data "Iris."
head(iris)


#### Example: Use ggplot to read in colors ####
#Approach 1: Read in colors directly when you run ggplot. 
#This approach gives ggplot a list of colors and lets it decide which goes with which category. 

#Let's make a bar plot comparing petal length between species.
#We have to first assign a column to fill in the aes(). We will assign Species to this column.
#We also have to write our scale_fill_manual() and assign values to our vector of colors.
ggplot(data = iris,
        aes(
          x = Species,
            y = Petal.Length,
            fill = Species
           )
        ) +
        geom_col() +
        theme_bw() +
        scale_fill_manual(values = c("#7CC6FE", 
                                     "#CCD5FF",
                                     "#E7BBE3")
                         )

#Notice when you type in specific hex codes, R will show the color that code represents!



#Approach 2: Set colors, represented by hex codes, as a vector before using ggplot.
#This approach is useful when you have many variables and want specific colors to be assigned to each variable.
colors <- c("#7CC6FE", 
            "#CCD5FF",
            "#E7BBE3")


#Let's assign these colors to different species of Iris.

Species(colors) <- c("setosa",
                     "versicolor",
                     "virginica")

#You will get an error stating "Error in Species(colors) <- c("setosa", "versicolor", "virginica"): could not find function "Species<-". 
#You can ignore this error for now. It will work later when we run it in ggplot! 

#Let's make the same bar plot comparing Petal Length between different species of Iris.
ggplot(data = iris,
       aes(
         x = Species,
           y = Petal.Length,
           fill = Species
           )
      ) +
        geom_col() +
        scale_fill_manual(values = colors,
                          labels = c("I. setosa",
                                     "I. versicolor",
                                     "I. virginica")) +
        theme_bw()

#What if we didn't have the scale_fill_manual line? 
ggplot(data = iris,
       aes(x = Species,
           y = Petal.Length,
           fill = Species)) +
  geom_col() +
  theme_bw()
#This will show the default colors in ggplot, rather than the color palette you wanted originally. 

#### Students' Attempt ####
#Using the same Iris dataset, choose your own color palette and decide which approach to use. 

#In this activity, we will make a linear plot comparing sepal width with sepal length. 
#Each line will be colored by the species.

#This is what the plot will look like with default colors. 
ggplot(data = iris,
       aes(x = Sepal.Width,
           y = Sepal.Length,
           color = Species)) +
  geom_line() +
  theme_bw()

#Approach 1: Set colors directly when running ggplot.
#Note that we are using color in the aes() and scale_color_manual() instead of fill and scale_fill_manual().
#This is because we use scale_fill_manual() for adding color to bars, boxes, and polygons, like in bar charts or box plots.
#We use scale_color_manual() for adding color to points, lines, borders, like in scatter plots or line graphs. 
ggplot(data = iris,
       aes(x = Sepal.Width,
           y = Sepal.Length,
           color = Species)) +
  geom_line() +
  scale_color_manual(values = c()) + #Add in here!
  theme_bw()

#Approach 2: Set colors, represented by hex codes, as a vector before using ggplot.
#Add your hex codes here!
colors_line <- c("",
                 "",
                 "") 

Species(colors_line) <- c("setosa",
                          "versicolor",
                          "virginica")

#We will still have the same error as before, but you can still ignore it.

ggplot(data = iris,
       aes(x = Sepal.Width,
           y = Sepal.Length,
           color = Species)) +
  geom_line() +
  scale_color_manual(values = colors_line,
                    labels = c("I. setosa",
                               "I. versicolor",
                               "I. virginica")) +
  theme_bw()






  

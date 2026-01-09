# =======================================================================
#
# USING COLOR IN R

# Activity designed by Mikaela Salvador, Hannah Hayes, and Anik Grearson
# for BIOE276/176 Winter 2026 

# By the end of this activity, students will be able to:
# 1. Import and apply different colors and color palettes in R
# 2. Recognize how color choices affect data interpretation
# 3. Carefully colors to make plots more accessible
# This activity assumes students are somewhat familiar with the ggplot package.

# Updated: 2026-01-08

# ========================================================================

# Anik comment: I feel like we should introduce the default color palette first, then
# introduce how to modify the colors manually using scale_color_manual() and
# scale_color_gradient() after that? Also, add options to try changing
# colors with the HEX code vs. using the built-in R color names. What do you guys think?
# Also, I changed the line plot to dot plots, because I think the line plots
# are a little difficult to look at in this dataset.

# I added a short section at the start to introduce Hex codes and built-in colors
# and some suggested additions/modifications to Activity 1 at the end of that section


# ------------------------------
# SET UP
# ------------------------------

#### Load packages ####
install.packages("ggplot2") # Install ggplot2 if not already installed
library(ggplot2) # Load the package

# ------------------------------
# INTRODUCTION: Colors in R
# ------------------------------

# BUILT-IN COLORS
# ---------------

# R has a set of 657 built-in color names you can use in your figures.
# Note that color names are case-sensitive!
# To see a list of the names, run:
colors()

# Some examples of built-in colors:
"black"
"white"
"red"
"blue"
"skyblue"
"brown"

# HEX CODES
# ---------------

# You can also define colors with HEX codes, which give you more precise control.
# Hex codes start with a # prefix followed by 3 pairs of two digits that define 
# red, green, and blue intensity: #RRGGBB, which range from 00 (none) to FF (full).

# Some examples of HEX codes:
"#000000" # No red, green, or blue = black
"#FFFFFF" # Full red, green, and blue = white
"#FF0000" # Full red, but no green or blue = pure red
"#4DBBD5"
# Notice how R nicely SHOWS you the color you've defined if you put it between ""!

# Optional challenge: See if you can figure out what the hex code is for pure green or pure blue.

# You can get HEX codes from online tools to chose colors visually, then 
# copy and paste the HEX codes into R. Common online tools to find HEX codes
# include Coolors, ColorBrewer, and Adobe Color.

# ------------------------------
# ACTIVITY 1: Colors in ggplot
# ------------------------------

# In this activity, you will practice using built-in color names and HEX codes
# to manually change colors in a plot and evaluate which choices are better for
# data interpretation and accessibility.

# We will be using one of the example datasets that is provided with R. 
# This dataset contains flower dimension measurements from 3 Iris species.
data(iris)

# Use head to look at the first few rows of the data "Iris."
head(iris)

# Approach 1: Read in colors directly when you run ggplot. 
# This approach gives ggplot a list of colors and lets it decide which goes with which category. 

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

#In this activity, we will make a dot plot comparing sepal width with sepal length. 
#Each line will be colored by the species.

#This is what the plot will look like with default colors. 
ggplot(data = iris,
       aes(x = Sepal.Width,
           y = Sepal.Length,
           color = Species)) +
  geom_point() +
  theme_bw()

#Approach 1: Set colors directly when running ggplot.
#Note that we are using color in the aes() and scale_color_manual() instead of fill and scale_fill_manual().
#This is because we use scale_fill_manual() for adding color to bars, boxes, and polygons, like in bar charts or box plots.
#We use scale_color_manual() for adding color to points, lines, borders, like in scatter plots or line graphs. 
ggplot(data = iris,
       aes(x = Sepal.Width,
           y = Sepal.Length,
           color = Species)) +
  geom_point() +
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
  geom_point() +
  scale_color_manual(values = colors_line,
                    labels = c("I. setosa",
                               "I. versicolor",
                               "I. virginica")) +
  theme_bw()

# ANIK SUGGESTIONS

# 1) Let's start by making a simple scatter plot using R's default colors to show 
# how sepal width changes with sepal length, and color the points by Iris species:
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color = Species)) +
  geom_point(size=2) +
  theme_bw()

# 2) We can also edit the colors manually by using built-in color names
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  scale_color_manual(values = c("green", "brown", "red")) +
  theme_bw()

# 3) ... or HEX codes!
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  scale_color_manual(values = c("#7CC6FE", "#CCD5FF", "#E7BBE3")) +
  theme_bw()

# 4) Alternatively, you can define which color is assigned to which species 
# in a vector. This makes the mapping more reproducible and ensures the same
# species always gets the same color, even if the factor order changes.
species_colors <- c(
  setosa     = "#0072B2",
  versicolor = "#D55E00",
  virginica  = "#009E73"
)

# Plot using defined colors without explicitly calling it in your code
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  scale_color_manual(values = species_colors) +
  theme_bw()

# REFLECTION: Look at the plots we generated using the 4 different approaches.
# Although all 4 methods are valid ways of coloring your figures:
# - Which plot makes it easiest to tell species apart?
# - Which plot would be most accessible to a color-blind reader?
# We encourage you to play around with different colors yourself!

# ------------------------------
# ACTIVITY 2: COLOR PALETTES
# ------------------------------

# Instead of defining your own color palettes, you can also use many pre-made
# color palettes from different R packages. This can be much quicker than 
# hand-picking individual colors. We will only cover 2 different packages
# in this activity, but we highly encourage you to browse the internet to 
# find more color palettes - there are virtually hundreds (if not thousands)
# available! 

# RColorBrewer
# ---------------

# One popular set is RColorBrewer
install.packages("RColorBrewer")
library(RColorBrewer) 

# Let's make a version of our scatter plot using the "Dark2" palette from RColorBrewer:
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  scale_color_brewer(palette = "Dark2") +
  theme_bw()

# To view all palettes in RColorBrewer:
display.brewer.all()

# ggsci
# ---------------

# The ggsci package contains many great palettes for publication quality figures
install.packages("ggsci")
library(ggsci)

# Let's make another version of our scatter plot using the Nature Publishing
# Group color palette in the ggsci package:
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  scale_color_npg() +
  theme_bw()

# Other color palettes in this package include the below options.
scale_color_aaas()
scale_color_lancet()
scale_color_jco()

# Play around with different color palettes, using this dataset and your own!


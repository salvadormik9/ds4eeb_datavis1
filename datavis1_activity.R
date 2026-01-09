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
#### SET UP ####
# ------------------------------

#Run this line if you do not have ggplot2 already installed
install.packages("ggplot2")
library(ggplot2) 

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
# Notice how R nicely SHOWS you the color you've defined if you put it between ""!

# Optional challenge: See if you can figure out what the hex code is for pure 
# green or pure blue.

# You can get HEX codes from online tools to chose colors visually, then 
# copy and paste the HEX codes into R. Common online tools to find HEX codes
# include Coolors, ColorBrewer, and Adobe Color.

# ------------------------------
# ACTIVITY 1: Colors in ggplot
# ------------------------------

# In this activity, you will practice using built-in color names and HEX codes
# to manually change colors in a plot and evaluate which choices are better for
# data interpretation and accessibility.

# We will be using one of the example data sets that is provided with R. 
# This dataset contains flower dimension measurements 
# (sepal width, sepal length, petal width, and petal length) from 3 Iris species.
data(iris)

# Use head to look at the first few rows of the data "Iris."
head(iris)

# 1) Default Colors: Let's start by making a simple scatter plot using R's 
# default colors to show how sepal width changes with sepal length, and 
# color the points by Iris species:
ggplot(iris, 
       aes(x=Sepal.Length, 
           y=Sepal.Width, 
           color = Species)) +
  geom_point(size=2) +
  theme_bw()

# 2) Built-In Color Names: We can also edit the colors manually within ggplot 
# by using built-in color names.
ggplot(iris, 
       aes(x=Sepal.Length, 
                 y=Sepal.Width, 
                 color = Species)) +
  geom_point(size = 2) +
  scale_color_manual(values = c("green",
                                "brown",
                                "red")) +
  theme_bw()

# 3) Hex Codes: We can also specify specific colors with HEX codes!
ggplot(iris, 
       aes(x=Sepal.Length,
           y=Sepal.Width, 
           color = Species)) +
  geom_point(size = 2) +
  scale_color_manual(values = c("#7CC6FE",
                                "#CCD5FF",
                                "#E7BBE3")) +
  theme_bw()

# 4) Alternatively, instead of reading in colors directly in ggplot, you can
# define which color is assigned to which species in a vector beforehand.
# This approach is useful when you have many variables and many plots
# and want to keep the color of your variables consistent. This makes the 
# mapping more reproducible and ensures the same species always gets the same 
# color, even if the factor order changes. 

#Let's first define the same colors as the previous plot before running ggplot.
species_colors <- c(
  setosa     = "#7CC6FE",
  versicolor = "#CCD5FF",
  virginica  = "#E7BBE3")

# Plot using defined colors without explicitly calling it in your code
ggplot(iris, 
       aes(x=Sepal.Length,
           y=Sepal.Width, 
           color = Species)) +
  geom_point(size = 2) +
  scale_color_manual(values = species_colors) +
  theme_bw()

# 5) Your Turn! 
# Using 1 of the 4 methods we showed above, create a line plot 
# comparing petal length against petal width. Set each species as 
# a different color that you pick. 

#Note that instead of using geom_point(), which is for scatterplots, 
# you would instead use geom_line()!





# REFLECTION: Look at the plots we generated using the 4 different approaches.
# Although all 4 methods are valid ways of coloring your figures:
# - Which plot makes it easiest to tell species apart?
# - Which plot would be most accessible to a color-blind reader?

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
ggplot(iris, 
       aes(Sepal.Length, 
           Sepal.Width, 
           color = Species)) +
  geom_point(size = 2) +
  scale_color_brewer(palette = "Dark2") +
  theme_bw()

# To view all palettes in RColorBrewer:
display.brewer.all()

# If you get an error stating "Error in plot.new() : figure margins too large,"
# when running display.brewer.all(), just expand your plot window and run again!
# You may need to press Zoom below Plot to see the names of the color palettes.

# ggsci
# ---------------

# The ggsci package contains many great palettes for publication quality figures
install.packages("ggsci")
library(ggsci)

# Let's make another version of our scatter plot using the Nature Publishing
# Group color palette in the ggsci package:
ggplot(iris, 
       aes(x=Sepal.Length, 
           y=Sepal.Width, 
           color = Species)) +
  geom_point(size = 2) +
  scale_color_npg() +
  theme_bw()

# Other color palettes in this package include the below options.
scale_color_aaas()
scale_color_lancet()
scale_color_jco()

# Your Turn: Play around with different color palettes in RColorBrewer and ggsci,
# using the Iris dataset! 


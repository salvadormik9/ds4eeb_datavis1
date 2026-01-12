# =======================================================================
#
# USING COLOR IN R

# Activity designed by Mikaela Salvador, Hannah Hayes, and Anik Grearson
# for BIOE276/176 Winter 2026 

# By the end of this activity, students will be able to:
# 1. Import and apply different colors and color palettes in R
# 2. Recognize how color choices affect data interpretation
# 3. Carefully choose colors to make plots more accessible

# This activity assumes students are somewhat familiar with the ggplot package.

# ========================================================================

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
# This dataset contains flower dimension measurements. 
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
# and want to keep the color of your variables consistent across plots. This 
# makes the mapping more reproducible, even if the factor order changes. 

# Let's first define the same colors as the previous plot before running ggplot.
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

# Note that instead of using geom_point(), which is for scatter plots, 
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

# One popular set is RColorBrewer.
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
scale_color_aaas() #American Association for the Advancement of Science
scale_color_lancet() #Lancet family of medical journals
scale_color_jco() #Journal of Clinical Oncology

# Your Turn: Play around with different color palettes in RColorBrewer and ggsci,
# using the Iris dataset! 


# -------------------------------------
# ACTIVITY 3: ACCESSIBLE COLOR PALLETES 
# -------------------------------------

# After choosing a palette that you like, you can check whether or not
# the palette is color-blind friendly. There are many R tools we can use, but in 
# this activity, we will be using the colorblindcheck and the colorspace
# R packages.
 
# For a moment, let's see the world through different eyes ;)

# colorblindcheck
# ---------------
# The colorblindcheck package helps you test whether your color palettes and
# plots are readable for people with color vision deficiencies (CVD). It will
# show how your palettes look to people with different CVDs.

install.packages("colorblindcheck")
library(colorblindcheck)

# Using the base R function rainbow(), let's create a vector of 7 colors to 
# act as our color palette.

rainbow_pal = rainbow(n = 7)
rainbow_pal
# "#FF0000" (pure red) "#FFDB00" (yellow) "#49FF00" (lime green) 
# "#00FF92" (green-cyan) "#0092FF" (sky blue) "#4900FF" (violet) 
# "#FF00DB" (magenta)

# Let's check if the rainbow color palette is color-blind friendly, using 
# palette_check(). 
palette_check(rainbow_pal, plot = TRUE)

# Let's first look at the plot in the right. This command will print out a plot of 
# distribution of how colors  appear to the "normal" eye versus the eyes of 
# different vision impairments  (e.g. Deuteranopia (green-blind), 
# Protanopia (red-blind), and Tritanopia (blue-blind)).

# Let's also look at the results printed in the console! 
# palette_check() will give you a table, where
# - tolerance is the minimum recommended distance between any two colors 
# that is used as a threshold
# - ncp is the number of color pairs tested
# - ndcp is the number of distinguishable color pairs whose distance 
# exceeds the tolerance
# - min_dist is the minimum distance between any two colors in the palette, and
# - mean_dist is the average distance across all color pairs.

# Ideally, you would want the min_dist to be equal to or greater than the
# tolerance and ndcp to equal ncp for all color-vision-deficiencies.


# Here is another useful command in the colorblindcheck package!
# palette_dist() calculates the distance between every pair of 
# colors in the palette. It outputs a distance matrix, where large values mean
# the colors are more distinct, and smaller values mean the colors are hard 
# to tell apart. 
palette_dist(rainbow_pal)

# REFLECTION: Compare the colors produced in palette_check() and the matrix values 
# produced in palette_dist() for our color palette rainbow_pal. 
# - Which colors are difficult to distinguish for different CVD?
# - Which colors would you change in the palette? 

# Your Turn: Practice setting your own color palette and check if it is 
# color-blind friendly!

# Note that these are the same hex codes from Activity 1. 
# Make sure to change the hex codes to what you want!
species_colors <- c("#7CC6FE","#CCD5FF", "#E7BBE3")
palette_check(species_colors, plot = TRUE)

# In case we want to use a predefined palette like we showed in Activity 2, 
# here is an example of checking the Dark2 palette from RColorBrewer. 
Dark2_pal <- brewer.pal(n = 8, name = "Dark2")
Dark2_pal
palette_check(Dark2_pal, plot = TRUE)

# colorspace
# ---------------
# Another similar package that checks your color palette is the colorspace
# package!

# Install and load the colorspace package
install.packages("colorspace")
library(colorspace)

# We'll then make our own color palette and play around with it.

my_palette <- c("#1b9e77", "#d95f02", "#7570b3")


# Let's take a look and see what the original colors look like first. We do
# this by using the swatchplot() function.
swatchplot(my_palette)

# Now let's see what it looks like with common color vision deficiencies (CVDs).
# We will be looking at the same CVDs as the colorblindcheck package:
# (Deuteranopia (green-blind), Protanopia (red-blind), and Tritanopia (blue-blind).
swatchplot(
  my_palette,
  cvd = c("deutan", "protan", "tritan")
)
# Notice that we produce a similar plot to the colorblindcheck package! 

# Finally, let's see an example of a good color palette! 
nice <- c(
  "#E69F00", "#56B4E9", "#009E73",
  "#F0E442", "#0072B2", "#D55E00",
  "#CC79A7"
)

swatchplot(nice)
swatchplot(nice, cvd = c("deutan", "protan", "tritan"))

# As you observed in this activity, many of the colors that may be easily 
# distinguishable to you, might not be for others. It's important that we 
# choose a color scheme that still conveys data aesthetically, but also 
# accessible for all!

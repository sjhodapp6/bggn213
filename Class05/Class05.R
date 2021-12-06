# Class 05: data visualization

# Using the ggplot2 package

# Load package
library(ggplot2)

# We will se this inbuilt "cars" dataset first
head(cars)

# All ggplots have at least 3 layers:
#   data + aes + geoms
ggplot(data=cars) + aes(x=speed, y=dist) + geom_point() + 
  geom_smooth(method="lm")
  labs(title="Stopping Distance of Old Cars", 
       x="Speed (MPH)", y="Stopping Sistance (ft)")
  
# Side note: ggplot is not the only graphics system
# A very popular one is"base" R graphics
plot(cars)


# Lab report questions
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

nrow(genes) # number of rows
colnames(genes) # column names
ncol(genes) # number of columns
table(genes$State) # number of genes per state
table(genes$State)/nrow(genes) * 100 # fraction of total up-regulated genes
round(table(genes$State)/nrow(genes) * 100, 3) # 3 significant figures

# make scatter plot
p <- ggplot(genes) + aes(x=Condition1, y=Condition2, col=State) + geom_point()
p

p + scale_colour_manual( values=c("blue","gray","red") ) + 
  labs(title="Gene Expression Changes Upon Drug Treatment", 
       x="Control (no drug)", y="Drug Treatment")

# Install gapminder dataset
# Contains economic and demographic data about various countries since 1952
# install.packages("gapminder")
library(gapminder)

# read-in data from online
url <- "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv"

gapminder <- read.delim(url)

# install.packages("dplyr")
library(dplyr) 

# Let's make a jitter plot of year vs lifeExp
ggplot(gapminder) + aes(x=year, y=lifeExp, col=continent) + 
  geom_jitter(width=0.3,alpha=0.4) + geom_boxplot( aes(group=year), alpha=0.2 )

# Violin plot
lifeExp_by_continent <- ggplot(gapminder) + aes(x=year, y=lifeExp, col=continent) + 
  geom_jitter(width=0.3,alpha=0.4) + geom_violin(aes(group=year), alpha=0.2, draw_quantiles=0.5) 
lifeExp_by_continent

# Install the plotly
# install.packages("plotly")
# library(plotly)
# ggplotly()

# Filter by the year 2007
gapminder_2007 <- gapminder %>% filter(year==2007)

# Scatter plot of GDP per capita vs life expectancy
# Colored by continent and sized by population
ggplot(gapminder_2007) + aes(x=gdpPercap, y=lifeExp, col=continent, size=pop) + 
  geom_point(alpha=0.5)

# Colored by population
ggplot(gapminder_2007) + aes(x=gdpPercap, y=lifeExp, col=pop) + 
  geom_point(alpha=0.5)

# Sized by population
ggplot(gapminder_2007) + aes(x = gdpPercap, y = lifeExp, size = pop) +
  geom_point(alpha=0.5) + scale_size_area(max_size = 10)

# Filter by the year 1957
gapminder_1957 <- gapminder %>% filter(year==1957)

ggplot(gapminder_1957) + aes(x=gdpPercap, y=lifeExp, col=continent, size=pop) +
  geom_point(alpha=0.7) + scale_size_area(max_size = 15)

# Filter and plot 1957 and 2007
gapminder_both <- gapminder %>% filter(year==1957 | year==2007)

ggplot(gapminder_both) + aes(x=gdpPercap, y=lifeExp, col=continent, size=pop) +
  geom_point(alpha=0.7) + scale_size_area(max_size = 15) + facet_wrap(~year)

# Make bar graph showing the number of people in the top 5 largest countries
gapminder_top5 <- gapminder %>% 
  filter(year==2007) %>% 
  arrange(desc(pop)) %>% 
  top_n(5, pop)

gapminder_top5
 
ggplot(gapminder_top5) + aes(x=country, y=pop, fill=continent) + geom_col()

# Plot population size by country
ggplot(gapminder_top5) + aes(x=reorder(country, -pop), y=pop, fill=country) + geom_col() +
    geom_col(col="gray30") + guides(fill=FALSE)


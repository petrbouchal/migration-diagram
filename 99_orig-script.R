library(readxl)
X2015_2017ZMENA <- read_excel("2015-2017ZMENA.xls")
View(X2015_2017ZMENA)
library(circlize)

grid.col = c(EAST_AFR = "darkgreen", MID_AFR = "chartreuse4", NORTH_AFR = "chartreuse3", SOUTH_AFR = "darkolivegreen", WEST_AFR = "darkolivegreen3", CENT_ASIA = "blue4", EAST_ASIA = "blue1", SOUTH_ASIA = "cornflowerblue", SOUTH_EAST_ASIA = "cyan3", WEST_ASIA = "deepskyblue", EAST_EUR = "brown3", NORTH_EUR = "brown1", SOUTH_EUR = "coral", WEST_EUR = "darkred", CARIB = "blueviolet", CENT_AM = "darkmagenta", SOUTH_AM = "darkorchid2", NORTH_AM = "darksalmon", OCE = "deeppink3")
chordDiagram(X2015_2017ZMENA, grid.col = grid.col, order("EAST_AFR", "MID_AFR", "NORTH_AFR", "SOUTH_AFR", "WEST_AFR", "CENT_ASIA", "EAST_ASIA", "SOUTH_ASIA", "SOUTH_EAST_ASIA", "WEST_ASIA", "EAST_EUR", "NORTH_EUR", "SOUTH_EUR", "WEST_EUR", "CARIB", "CENT_AM", "SOUTH_AM", "NORTH_AM", "OCE"))

mat = X2015_2017ZMENA

chordDiagram(mat)

library(Matrix)
as.matrix.data.frame(X2015_2017ZMENA)

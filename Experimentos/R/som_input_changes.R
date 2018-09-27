#carregar biblioteca
library("kohonen")
library(readr)

#carregar dados no R
Facebook_metrics_complete <- read_csv("R/Facebook_metrics_complete.csv")

#entradas
input <- Facebook_metrics_complete[,1:10]

#escalonar os dados das matrizes
input.sc <- scale(input)

#definir parametros de SOM
#diferentes tamanhos de grid
#input.grid1 <- somgrid(x=16, y=7, topo="hexagonal")
#input.grid2 <- somgrid(x=16, y=7, topo="rectangular")
#input.grid3 <- somgrid(x=16, y=16, topo="hexagonal")
input.grid4 <- somgrid(x=16, y=16, topo="rectangular")

#executar diversas SOM
set.seed(100)

#input.som111 <- som(input.sc, grid=input.grid1, rlen=100, alpha=c(0.05, 0.01))
#input.som121 <- som(input.sc, grid=input.grid1, rlen=500, alpha=c(0.05, 0.01))
#input.som131 <- som(input.sc, grid=input.grid1, rlen=1000, alpha=c(0.05, 0.01))

#input.som112 <- som(input.sc, grid=input.grid1, rlen=100, alpha=c(0.25, 0.01))
#input.som122 <- som(input.sc, grid=input.grid1, rlen=500, alpha=c(0.25, 0.01))
#input.som132 <- som(input.sc, grid=input.grid1, rlen=1000, alpha=c(0.25, 0.01))

#input.som113 <- som(input.sc, grid=input.grid1, rlen=100, alpha=c(0.50, 0.01))
#input.som123 <- som(input.sc, grid=input.grid1, rlen=500, alpha=c(0.50, 0.01))
#input.som133 <- som(input.sc, grid=input.grid1, rlen=1000, alpha=c(0.50, 0.01))

#input.som211 <- som(input.sc, grid=input.grid2, rlen=100, alpha=c(0.05, 0.01))
#input.som221 <- som(input.sc, grid=input.grid2, rlen=500, alpha=c(0.05, 0.01))
#input.som231 <- som(input.sc, grid=input.grid2, rlen=1000, alpha=c(0.05, 0.01))

#input.som212 <- som(input.sc, grid=input.grid2, rlen=100, alpha=c(0.25, 0.01))
#input.som222 <- som(input.sc, grid=input.grid2, rlen=500, alpha=c(0.25, 0.01))
#input.som232 <- som(input.sc, grid=input.grid2, rlen=1000, alpha=c(0.25, 0.01))

#input.som213 <- som(input.sc, grid=input.grid2, rlen=100, alpha=c(0.50, 0.01))
#input.som223 <- som(input.sc, grid=input.grid2, rlen=500, alpha=c(0.50, 0.01))
#input.som233 <- som(input.sc, grid=input.grid2, rlen=1000, alpha=c(0.50, 0.01))

#input.som311 <- som(input.sc, grid=input.grid3, rlen=100, alpha=c(0.05, 0.01))
#input.som321 <- som(input.sc, grid=input.grid3, rlen=500, alpha=c(0.05, 0.01))
#input.som331 <- som(input.sc, grid=input.grid3, rlen=1000, alpha=c(0.05, 0.01))

#input.som312 <- som(input.sc, grid=input.grid3, rlen=100, alpha=c(0.25, 0.01))
#input.som322 <- som(input.sc, grid=input.grid3, rlen=500, alpha=c(0.25, 0.01))
#input.som332 <- som(input.sc, grid=input.grid3, rlen=1000, alpha=c(0.25, 0.01))

#input.som313 <- som(input.sc, grid=input.grid3, rlen=100, alpha=c(0.50, 0.01))
#input.som323 <- som(input.sc, grid=input.grid3, rlen=500, alpha=c(0.50, 0.01))
#input.som333 <- som(input.sc, grid=input.grid3, rlen=1000, alpha=c(0.50, 0.01))

input.som411 <- som(input.sc, grid=input.grid4, rlen=100, alpha=c(0.05, 0.01))
input.som421 <- som(input.sc, grid=input.grid4, rlen=500, alpha=c(0.05, 0.01))
input.som431 <- som(input.sc, grid=input.grid4, rlen=1000, alpha=c(0.05, 0.01))

input.som412 <- som(input.sc, grid=input.grid4, rlen=100, alpha=c(0.25, 0.01))
input.som422 <- som(input.sc, grid=input.grid4, rlen=500, alpha=c(0.25, 0.01))
input.som432 <- som(input.sc, grid=input.grid4, rlen=1000, alpha=c(0.25, 0.01))

input.som413 <- som(input.sc, grid=input.grid4, rlen=100, alpha=c(0.50, 0.01))
input.som423 <- som(input.sc, grid=input.grid4, rlen=500, alpha=c(0.50, 0.01))
input.som433 <- som(input.sc, grid=input.grid4, rlen=1000, alpha=c(0.50, 0.01))

#plots
plot(input.som411, type="changes", main="Progesso do treinamento - 16x16R - aplha .05 e .01")
plot(input.som421, type="changes", main="Progesso do treinamento - 16x16R - aplha .05 e .01")
plot(input.som431, type="changes", main="Progesso do treinamento - 16x16R - aplha .05 e .01")

plot(input.som412, type="changes", main="Progesso do treinamento - 16x16R - aplha .25 e .01")
plot(input.som422, type="changes", main="Progesso do treinamento - 16x16R - aplha .25 e .01")
plot(input.som432, type="changes", main="Progesso do treinamento - 16x16R - aplha .25 e .01")

plot(input.som413, type="changes", main="Progesso do treinamento - 16x16R - aplha .5 e .01")
plot(input.som423, type="changes", main="Progesso do treinamento - 16x16R - aplha .5 e .01")
plot(input.som433, type="changes", main="Progesso do treinamento - 16x16R - aplha .5 e .01")


#carregar biblioteca
library("kohonen")
library(readr)
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization

#carregar dados no R
Facebook_metrics_complete <- read_csv("R/Facebook_metrics_complete.csv")

#entradas
input <- Facebook_metrics_complete[,1:10]

#escalonar os dados das matrizes
input.sc <- scale(input)

#definir parametros de SOM
#tamanho do grid
input.grid <- somgrid(x=16, y=7, topo="hexagonal")

#executar SOM
set.seed(100)
input.som <- som(input.sc, grid=input.grid, rlen=100, alpha=c(0.05, 0.01))

#plots
plot(input.som, type="changes", main="Progesso do treinamento")
plot(input.som, type="counts", main="Contagem de instâncias por bloco")
plot(input.som, type="dist.neighbours", main="Distância euclidiana entre blocos vizinhos")

#definicoes das cores para o heatmap
coolBlueHotRed <- function(n, alpha = 1) {
  rainbow(n, end=4/6, alpha=alpha)[n:1]
}

#heatmaps para todas as variaveis
par(mfrow=c(5,2))
for (j in 1:ncol(getCodes(input.som))){
  plot(input.som,type="property",property=getCodes(input.som)[,j],main=names(getCodes(input.som)[1,])[j],palette.name=coolBlueHotRed)
}
par(mfrow=c(1,1))

#vizualizacao de numero ideal de clusteres
#input.data <- getCodes(input.som) 
#	wss <- (nrow(input.data)-1)*sum(apply(input.data,2,var)) 
#	for (i in 2:20) {
#		wss[i] <- sum(kmeans(input.data, centers=i)$withinss)
#	}
#plot(wss, main="Whitin-clusters sum of squares")

wss <- fviz_nbclust(getCodes(input.som), kmeans, method = "wss", k.max = 20)
plot(wss)

#clusterizacao hierarquica
groups = 12
input.hc = cutree(hclust(dist(getCodes(input.som))), groups)
plot(input.som, type="codes", bgcol=rainbow(groups)[input.hc])
add.cluster.boundaries(input.som, input.hc)
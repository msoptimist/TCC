#carregar biblioteca
library("kohonen")
library(readr)
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization

#carregar dados no R
facebook.metrics <- read_csv("R/Facebook_metrics_complete.csv")

#escalonar os dados das matrizes
facebook.metrics.sc <- scale(facebook.metrics)

#definir parametros de SOM
#tamanho do grid
facebook.metrics.grid <- somgrid(x=16, y=16, topo="rectangular")

#executar SOM
set.seed(100)
facebook.metrics.som <- som(facebook.metrics.sc, grid=facebook.metrics.grid, rlen=500, alpha=c(0.5, 0.01))

#plots
#plot(facebook.metrics.som, type="changes", main="Progesso do treinamento")
#plot(facebook.metrics.som, type="counts", main="Contagem de instâncias por bloco")
#plot(facebook.metrics.som, type="dist.neighbours", main="Distância euclidiana entre blocos vizinhos")

#definicoes das cores para o heatmap
#coolBlueHotRed <- function(n, alpha = 1) {
#  rainbow(n, end=4/6, alpha=alpha)[n:1]
#}

#heatmaps para todas as variaveis
#par(mfrow=c(1,2))
#for (j in 1:ncol(getCodes(facebook.metrics.som))){
#  plot(facebook.metrics.som,type="property",property=getCodes(facebook.metrics.som)[,j],main=names(getCodes(facebook.metrics.som)[1,])[j],palette.name=coolBlueHotRed)
#}
#par(mfrow=c(1,1))

#vizualizacao de numero ideal de clusteres
#facebook.metrics.data <- getCodes(facebook.metrics.som)
#	wss <- (nrow(facebook.metrics.data)-1)*sum(apply(facebook.metrics.data,2,var)) 
#	for (i in 2:20) {
#		wss[i] <- sum(kmeans(facebook.metrics.data, centers=i)$withinss)
#	}
#plot(wss, main="Whitin-clusters sum of squares")

#wss <- fviz_nbclust(getCodes(facebook.metrics.som), kmeans, method = "wss", k.max = 30)
#plot(wss)

#clusterizacao hierarquica
groups = 20
facebook.metrics.hc = cutree(hclust(dist(getCodes(facebook.metrics.som))), groups)
#plot(facebook.metrics.som, type="codes", bgcol=rainbow(groups)[facebook.metrics.hc])
#add.cluster.boundaries(facebook.metrics.som, facebook.metrics.hc)

class.complete <- facebook.metrics.hc[facebook.metrics.som$unit.classif]
#facebook.metrics$Class <- class.complete
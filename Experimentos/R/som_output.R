#carregar biblioteca
library("kohonen")
library(readr)

#carregar dados no R
Facebook_metrics_complete <- read_csv("R/Facebook_metrics_complete.csv")

#entradas
output <- Facebook_metrics_complete[,11:22]

#escalonar os dados das matrizes
output.sc <- scale(output)

#definir parametros de SOM
#tamanho do grid
output.grid <- somgrid(x=16, y=16, topo="rectangular")

#executar SOM
set.seed(100)
output.som <- som(output.sc, grid=output.grid, rlen=500, alpha=c(0.5, 0.01))

#plots
#plot(output.som, type="counts", main="Contagem de instâncias por bloco")
#plot(output.som, type="dist.neighbours", main="Distância euclidiana entre blocos vizinhos")


#definicoes das cores para o heatmap
#coolBlueHotRed <- function(n, alpha = 1) {
#  rainbow(n, end=4/6, alpha=alpha)[n:1]
#}

#heatmaps para todas as variÃ¡veis
#par(mfrow=c(1,2))
#for (j in 1:ncol(getCodes(output.som))){
#  plot(output.som,type="property",property=getCodes(output.som)[,j],palette.name=coolBlueHotRed,main=names(getCodes(output.som)[1,])[j],cex=0.5)
#}
#par(mfrow=c(1,1))

#vizualizacao de numero ideal de clusteres
#input.data <- getCodes(input.som) 
#	wss <- (nrow(input.data)-1)*sum(apply(input.data,2,var)) 
#	for (i in 2:20) {
#		wss[i] <- sum(kmeans(input.data, centers=i)$withinss)
#	}
#plot(wss, main="Whitin-clusters sum of squares")

#wss <- fviz_nbclust(getCodes(output.som), kmeans, method = "wss", k.max = 30)
#plot(wss)

#clusterizacaoo hierarquica
groups = 20
output.hc = cutree(hclust(dist(getCodes(output.som))), groups)
plot(output.som, type="codes", bgcol=rainbow(groups)[output.hc])
add.cluster.boundaries(output.som, output.hc)
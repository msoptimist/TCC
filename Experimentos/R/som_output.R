#carregar biblioteca
library("kohonen")
library(readr)

#carregar dados no R
Facebook_metrics_complete <- read_csv("R/Facebook_metrics_complete.csv")

#entradas
output <- Facebook_metrics_complete[,11:22]

#escalonar os dados das matrizes
output.sc <- scale(output)

#definir parâmetros de SOM
#tamanho do grid
output.grid <- somgrid(x=16, y=7, topo="hexagonal")

#executar SOM
set.seed(100)
output.som <- som(output.sc, grid=output.grid, rlen=100, alpha=c(0.05, 0.01))

#plots
plot(output.som, type="counts")
plot(output.som, type="dist.neighbours")

#definições das cores para o heatmap
coolBlueHotRed <- function(n, alpha = 1) {
  rainbow(n, end=4/6, alpha=alpha)[n:1]
}

#heatmaps para todas as variáveis
par(mfrow=c(5,2))
for (j in 1:ncol(getCodes(output.som))){
  plot(output.som,type="property",property=getCodes(output.som)[,j],palette.name=coolBlueHotRed,main=colnames(getCodes(output.som)[,j]),cex=0.5)
}
par(mfrow=c(1,1))

#vizualização de numero ideal de clusteres
output.data <- getCodes(output.som) 
	wss <- (nrow(output.data)-1)*sum(apply(output.data,2,var)) 
	for (i in 2:20) {
		wss[i] <- sum(kmeans(output.data, centers=i)$withinss)
	}
plot(wss)

#clusterização hierarquica
groups = 9
output.hc = cutree(hclust(dist(getCodes(output.som))), groups)
plot(output.som, type="codes", bgcol=rainbow(groups)[output.hc])
add.cluster.boundaries(output.som, output.hc)
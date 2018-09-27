#carregar biblioteca
library("kohonen")
library(readr)

#carregar dados no R
Facebook_metrics_complete <- read_csv("R/Facebook_metrics_complete.csv")

#separar em dois grupos:
#entradas
Facebook_metrics_input <- Facebook_metrics_complete[,1:10]

#saídas
Facebook_metrics_output <- Facebook_metrics_complete[,11:22]

#escalonar os dados das matrizes
Facebook_metrics_input.sc <- scale(Facebook_metrics_input)
Facebook_metrics_output.sc <- scale(Facebook_metrics_output)

#definir parâmetros de SOM
#tamanho do grid
Facebook.grid = list(somgrid(x=5, y=5, topo="hexagonal"), somgrid(x=10, y=10, topo="hexagonal"), somgrid(x=16, y=8, topo="hexagonal"), somgrid(x=16, y=16, topo="hexagonal"), somgrid(x=20, y=20, topo="hexagonal"))

#quantidade de interações
rlen <- c(100, 1000, 10000, 100000)

#taxa de aprendizado
alpha <- matrix(c(0.05, 0.1, 0.05, 0.1, 0.01, 0.01, 0.05, 0.1), nrow=4)
dimnames(alpha) = list(c("5>1", "10>1", "5>5", "10>10"), c("X", "Y"))

#raio da vizinhança

#executar SOM
Facebook_metrics_input.som = som(Facebook_metrics_input.sc, grid=Facebook.grid[[4]], rlen=rlen[2], alpha=alpha[1,])

Facebook_metrics_output.som = som(Facebook_metrics_output.sc, grid=Facebook.grid[[4]], rlen=rlen[2], alpha=alpha[1,])

#plotar mapas changes, counts e dist.neighbours de cada variação
plot(Facebook_metrics_input.som, type="counts", main="Input counts")
plot(Facebook_metrics_input.som, type="dist.neighbours", main="Input dist")

plot(Facebook_metrics_output.som, type="counts", main="Output counts")
plot(Facebook_metrics_output.som, type="dist.neighbours", main="Output dist")


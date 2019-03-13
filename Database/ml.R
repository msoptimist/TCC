#altera workspace para diretório do projeto
setwd("E:/Documents - data drive/TCC/Database")

#carrega dados do arquivo csv
database <- read.csv("dataset_Facebook.csv", header = T)

#normalização dos dados numéricos
normalized_database <- as.data.frame(scale(database[,-which(names(database) == "Type")]))

#separação dos atributos em input e output
input_names <- names(normalized_database[,1:6])
output_names <- names(normalized_database[,7:18])

#boxplots dos inputs e outputs da base
par(mar = c(2, 7, 1, 1))
boxplot(normalized_database[,input_names], horizontal = T, las = 2)

par(mar = c(2, 13, 1, 1))
boxplot(normalized_database[,output_names], horizontal = T, las = 2)

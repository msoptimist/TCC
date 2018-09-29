#precisa que rode os outros scripts para ter os dados na variaveis globais
library("caret")

class.complete<-factor(class.complete)
class.input<-factor(class.input)
class.output<-factor(class.output)

union.complete.input <- union(class.complete, class.input)
confusion.table <- table(factor(class.input, union.complete.input), factor(class.complete, union.complete.input))
confusionMatrix(confusion.table)
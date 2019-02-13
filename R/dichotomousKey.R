#file structure - simple

#the file str should follow

#words in the parenthesis () are notations, not to be included

#id(index) | P(Phenotype) | G(Genotypical reference) | ref(reference) | ... ...
#
#
#
#
#
#
#
#to view and edit : edit(dichotomousKey_str)  or View() in Rstudio

dk_eg = data.frame(id = c(1,1,2,2,3,3,4,4),
                                P = c('plants like','animal like','woody trunk','soft stem','live under water','live on land','hair','feathers'),
                                G = c('plants','animal','tree','flower','fish','land_animal','mammal','bird'),
                                ref = c(2,3,0,0,0,4,0,0),stringsAsFactors = F)
#View(dichotomousKey_str)

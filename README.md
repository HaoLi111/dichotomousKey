# dichotomousKey
Package: dichotomousKey Type: Package Title: Dichotomous Key Manipulation Version: 0.1.0 Author: Hao Li Maintainer: Hao Li &lt;lhrcplanes@qq.com> Description: R package to manipulate Dichotomous Key.     Functions included are interactive classification CLI tools, extraction tools, and file and format transformation tools.     Functions can work on custom data as data frames or lists. License: GPL V3 Encoding: UTF-8 LazyData: true

You need Rtools and devtools to build the package. using
```
install.packages("devtools")
require(devtools)
install_github("HaoLi111/dichotomousKey")
require(dichotomousKey)
```
will work.

Documents available for download at

https://github.com/HaoLi111/docu-sys-modelling-toolbox/blob/master/DichotomousKey%20for%20R.pdf
https://github.com/HaoLi111/docu-sys-modelling-toolbox/blob/master/DichotomousKey%20package%20insight.pdf

Looking forward to your suggestion!

**Note: dk_search and dk_extract works for the generalized form of dk tables which each branch have 2 options (only branching 2 at a time) other functions are not guaranteed to work with this/ 
The suggested columns are id(identity of the father node for each sub-tree)/ P(phenotypical properties)/G(genotypical properties or species name)/ref(reference to the next node for classifications)**
You are welcomed to add supports for multiple selections for each classification step (or node). For the future, may use edges of the trees and sub-trees to store the data for faster computation and memory saving.

Newly implemented,undocumented feature:

Append and partition
```
> dk_append(dk_eg,dk_bird,"bird")
   id                P           G ref
1   1      plants like      plants   2
2   1      animal like      animal   3
3   2      woody trunk        tree   0
4   2        soft stem      flower   0
5   3 live under water        fish   0
6   3     live on land land_animal   4
7   4             hair      mammal   0
8   4         feathers        bird   5
9   5              Big    Big Bird   0
10  5            Small  Small Bird   0
> dk_partition(dk_append(dk_eg,dk_bird,"bird"),"animal")
  id                P           G ref
1  3 live under water        fish   0
2  3     live on land land_animal   4
3  4             hair      mammal   0
4  4         feathers        bird   5
5  5              Big    Big Bird   0
6  5            Small  Small Bird   0
```
Suggestion for quick view

As a table:
```
my_dk = edit(dk_eg)
```
Or
```
require(listviewer)
jsonedit(dk_eg)
```



With RStudio (as a list)
```
View(dk_as_list(dk_eg))
```
With Hmisc
```
library(Hmisc)
list.tree(dk_as_list(dk_eg),fill = "     -")
```
(output)
```
dk_as_list(dk_eg) = list 3 (11856 bytes)
     - [[1]] = list 4
     -     - [[1]] = list 2
     -     -     - pause = logical 1= TRUE
     -     -     - prim = list 2( data.frame )
     -     -     -     - P = character 1= woody trunk 
     -     -     -     - G = character 1= tree 
     -     -     -A  row.names = integer 1= 3
     -     - [[2]] = list 2
     -     -     - pause = logical 1= TRUE
     -     -     - prim = list 2( data.frame )
     -     -     -     - P = character 1= soft stem 
     -     -     -     - G = character 1= flower 
     -     -     -A  row.names = integer 1= 4
     -     - pause = logical 1= FALSE
     -     - prim = list 2( data.frame )
     -     -     - P = character 1= plants like 
     -     -     - G = character 1= plants 
     -     -A  row.names = integer 1= 1
     - [[2]] = list 4
     -     - [[1]] = list 2
     -     -     - pause = logical 1= TRUE
     -     -     - prim = list 2( data.frame )
     -     -     -     - P = character 1= live under water 
     -     -     -     - G = character 1= fish 
     -     -     -A  row.names = integer 1= 5
     -     - [[2]] = list 4
     -     -     - [[1]] = list 2
     -     -     -     - pause = logical 1= TRUE
     -     -     -     - prim = list 2( data.frame )
     -     -     -     -     - P = character 1= hair 
     -     -     -     -     - G = character 1= mammal 
     -     -     -     -A  row.names = integer 1= 7
     -     -     - [[2]] = list 2
     -     -     -     - pause = logical 1= TRUE
     -     -     -     - prim = list 2( data.frame )
     -     -     -     -     - P = character 1= feathers 
     -     -     -     -     - G = character 1= bird 
     -     -     -     -A  row.names = integer 1= 8
     -     -     - pause = logical 1= FALSE
     -     -     - prim = list 2( data.frame )
     -     -     -     - P = character 1= live on land 
     -     -     -     - G = character 1= land_animal 
     -     -     -A  row.names = integer 1= 6
     -     - pause = logical 1= FALSE
     -     - prim = list 2( data.frame )
     -     -     - P = character 1= animal like 
     -     -     - G = character 1= animal 
     -     -A  row.names = integer 1= 2
     - pause = logical 1= FALSE
```


Or interactively with listviewer.




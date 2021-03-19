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
#append dk2 onto dk 1
dk_bird = data.frame(id = c(1,1),
                    P = c("Big","Small"),
                    G = c("Big Bird","Small Bird"),
                    ref = c(0,0))

dk_append = function(dk1,dk2,append_to){
  dk1 = dk1[order(dk1$id),]
  dk2 = dk2[order(dk2$id),]
  dk1MaxRef = max(dk1$ref)
  dk2$id = dk2$id + dk1MaxRef
  dk1[which(dk1$G==append_to),'ref'] = dk1MaxRef+1
  rbind(dk1,dk2)
}
#dk_append(dk_eg,dk_bird,"bird")

dk_partition = function(dk,fatherTreeNode){
  dk = dk[order(dk$id),]
  ref1=dk[which(dk$G==fatherTreeNode),"ref"]
  dk = dk[which(dk$id>=ref1),]
  id =NULL;P=NULL;G=NULL;ref=NULL
  #message(dk)
  flag_changed = TRUE
  while(flag_changed){
    flag_changed = FALSE
    nr = nrow(dk)
    if(nr==0) break()
    i_rm = NULL
    for(i in 1:nr){
      if((dk$id[i]) %in% c(ref,ref1)){
        id = c(id,dk$id[i])
        P = c(P,dk$P[i])
        G = c(G,dk$G[i])
        ref = c(ref,dk$ref[i])
        flag_changed = TRUE
        i_rm = c(i_rm,i)
      }
    }
    if(!is.null(i_rm)){
      if(length(i_rm)==nr){
        break()
      }
      dk = dk[-i_rm,]
    }else{
      break()
    }
  }
  data.frame(id=id,P=P,G=G,ref =ref)
}
#dk_partition(dk_append(dk_eg,dk_bird,"bird"),"animal")
dk_reduce = function(dk){
  min_id = min(dk$id)
  dk['id']=dk['id'] - min_id +1
  for(i in 1:nrow(dk)){
    if(dk[i,'ref']!=0) dk[i,'ref'] = dk[i,'ref']-min_id+1
  }
  return(dk)
}
#dk_reduce(dk_partition(dk_append(dk_eg,dk_bird,"bird"),"animal"))
dk_is_a = function(a,b,dk){# a is a b
  if(a==b) return(TRUE)
  dk = dk[order(dk$id),]
  ref1=dk[which(dk$G==b),"ref"]
  dk = dk[which(dk$id>=ref1),]
  id =NULL;G=NULL;ref=NULL
  flag_changed = TRUE
  while(flag_changed){
    flag_changed = FALSE
    nr = nrow(dk)
    if(nr==0) break()
    i_rm = NULL
    for(i in 1:nr){
      if((dk$id[i]) %in% c(ref,ref1)){
        if(dk$G[i]==a) return(TRUE)
        id = c(id,dk$id[i])

        G = c(G,dk$G[i])
        ref = c(ref,dk$ref[i])
        flag_changed = TRUE
        i_rm = c(i_rm,i)
      }
    }
    if(!is.null(i_rm)){
      if(length(i_rm)==nr){
        return(FALSE)
      }
      dk = dk[-i_rm,]
    }else{
      return(FALSE)
    }
  }

}

#dk_is_a("Small Bird","land_animal",dk_partition(dk_append(dk_eg,dk_bird,"bird"),"animal"))
#dk_is_a("bird","animal",dk_eg)
#dk_is_a("fish","land_animal",dk_eg)

#x = dichotomousKey_str
dk_as_list = function(x=dk_eg,st = 1,asp = 2:3){
  flow = x[x$id==st,,drop=F]#;flow# corrsp row;
  l = list()#initialize
  if(ncol(flow)>1){
    for(i in 1:nrow(flow)){
      #assign list info
      ref<-flow[i,4]
      #message(ref)
      stopifnot(!missing(ref))
      if(ref==0){
        l[[i]] = list()#classification stop
        l[[i]]$pause = T
        #l = as.data.frame(l)
      }else if(ref==-1){
          #link to exterior
      }else{
          #normal ref, link to id
          l[[i]] = dk_as_list(x,ref,asp)
          l[[i]]$pause = F
        }
      l[[i]]$prim<- flow[i,asp,drop = F]
      #l[[i]]=as.list(l[[i]])
      stopifnot(!missing(ref))
    }
  }
  if(st==1) l$pause = F
  l
}
#l = dk_as_list(dk_exp);l;str(l)

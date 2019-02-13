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
        l[[i]] = flow[i,asp]#classification stop
      }else
        if(ref==-1){
          #link to exterior
        }else{
          #normal ref, link to id
          l[[i]] = dk_as_list(x,ref,asp)
        }
      l[[i]]$prim<- flow[i,asp,drop = F]
      stopifnot(!missing(ref))
    }
  }
  l
}
#l = dk_as_list(dk_exp);l;str(l)

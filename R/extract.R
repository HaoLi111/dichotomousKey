#extract
dk_extract = function(x = dk_eg,Gtarget = 'bird'){
  flow = x[x$G==Gtarget,]#flow is a vector (1 row)
  P = flow[,2:3]
  id=as.numeric(flow['id'])
  while(id!=1){
    flow = x[x$ref == id,]
    P = rbind(flow[,2:3],P)
    id = as.numeric(flow['id'])
  }
  return(P)
}

#extract()

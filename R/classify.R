#classify
dk_classify = function(x = dk_eg,asp = 3,show_img = F,show_link = F){
  message(paste('classification start from', deparse(substitute(x)),'\n in interactive mode \n to abort type\'q\''))
  ref = 1
  while(ref!=0){
    flow = x[x$id==ref,]
    message(paste('Phenotypical characteristic:'))
    for (i in 1:nrow(flow)){
      message(paste('Key :: ',i,' :: '))
      message(paste(flow[i,2:3],collapse =  ' :: || ::'))
    }
    re = readline()
    if(re=='q'|re=='quit'|re=='Q'){
      message('Quitted')
      return(flow)
    }else if(re=='b'){
      message('Back')#extraction
      # ref =
    }else{
    if(re>2){
     #warning('re > 2 :: not a dk')
    }
      #normal dk
      ref =as.numeric(flow[as.numeric(re),'ref'])
    }
  }
  return(flow[as.numeric(re),asp])
}
#classify(x)


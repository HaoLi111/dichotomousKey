#list_to_dk
list_as_dk = function(x){
  #x must be a convertible key
  #if(!length(x)==2) warning("Not a dk-convertible list")

  if(is.null(x[['prim']])) x$prim = data.frame(P =deparse(substitute(x)),
                                          G = deparse(substitute(x)))
  sub = x
  id=1
  ref=2
  df =NULL
  r = 0#row index

  id_adder = 0

  while(length(sub)>2){
    for(i in 1:(length(sub)-2)){

    prim = unlist(as.vector(sub[[i]]['prim']))
    rownames(prim)=NULL
    prim = prim[1:2,drop=T]
    if(length(sub[[i]])>2){
        df=rbind(df,c(id,prim,ref))#branch

        ref=ref+1
    }else{
      #end p
       df = rbind(df,c(id,prim,0))#no branch
    }
    if(id_adder ==1){
      id = id+1
      id_adder=0
    }else if(id_adder == 0){
      id_adder = 1
    }
    }
    #
    #upto
    #message('com')
  #id =id+i
    #r=r+i
    #id=ref+i
    sub2 = list()# =list(sub[[1]])
    i2=1

    for(i in 1:length(sub)){
      if(length(sub[[i]])==4){
        #length(sub[[i]])==3 && is.list(sub[[i]]) && sub[[i]]$pause == F){
        sub2[[i2]] = sub[[i]][[1]]
        sub2[[i2+1]] = sub[[i]][[2]]
        i2=i2+2
      }
    }
   #
    sub=sub2
    sub['prim'] = 'flow rehandling sublist'
    sub['pause'] =FALSE
   # print(df)
   # print(sub)
  }
  colnames(df) = c('id','P','G','ref')
  df2 = data.frame(id = as.integer(df[,'id']),P = df[,'P'],G = df[,'G'],ref = as.integer(df[,'ref']))
  colnames(df2) = c('id','P','G','ref')

  return(df2)
}

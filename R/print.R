dk_import.csv = function(path){
  dk = read.csv(path, header = T,stringsAsFactors = F)
}
dk_import.dir = function(path){
  message(paste("Reading rich dichotomous key data from",path))
  dk = read.csv(paste(path,'dk.csv',sep = '/'))


}

print_dk = function(dk){
  cn = colnames(dk)
  if(ncol(dk) == 4){
    message('4 cols simp dk')
    if(!identical(cn,c('id','P','G','ref'))){
      warning('colnames is not standardized')
    }
  }else{
    message(('mult cols dk'))
    if(!identical(cn[1:4],c('id','P','G','ref'))){
      warning('colnames is not standardized')
    }
    message(paste('including',paste(cn[4:length(cn)])))
    if(!is.null(dk$link)){
      print('including link')
    }
    if(!is.null(dk$img)){
      print('including img')
    }
    if(!is.null(dk$snd)){
      print('including snd')
    }
  }
  print(head(dk,3))
  print('...')
  print(tail(dk,3))
  print(length(is.na(dk[,1:4])))
}

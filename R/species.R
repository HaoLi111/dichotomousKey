species.default = list(Name = 'bird',
                       Tbl = 'dk_eg')
class(species.default) = 'species'
summary.species = function(x,...){

  Up=dk_extract(get(x$Tbl),x$Name)
  l = list(
    Up = Up,
    Down = dk_as_list(get(x$Tbl),
                      st = as.numeric(Up[ncol(Up),1]))
  )
  return(l)
}

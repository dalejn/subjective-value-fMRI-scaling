setwd("/Users/josephkable/Desktop/Dale/sv_zscore")

filenames <- list.files()
names <- substr(filenames, 1, 10)

for(i in names){
  filepath <- file.path(paste(i,".txt",sep=""))
  assign(i, read.csv(filepath, sep = ",", header=FALSE, skip=0))
  assign(i, split(get(i),rep(1:ceiling(240/30),each=30,length.out=240)))

  evenindex <- c(2,4,6,8)
  oddindex <- c(1,3,5,7)
  
  j<- scale(unlist(get(i)[evenindex]))
  k<- scale(unlist(get(i)[oddindex]))
  j<- relist(j,get(i)[evenindex])
  k<- relist(k,get(i)[oddindex])
  l<- append(j,k)
  assign(i, l[names(get(i))])

  write.table(
    get(i), sep="\n",
    file= paste("zscore",i,'txt',sep='.'),
    col.names = FALSE,
    row.names = FALSE)
}
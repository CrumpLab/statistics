Subjects<-c(rep(seq(1:20),each=200))
Trial<-c(rep(seq(1:200),20))
DelayA<-rep(c("100","500"),each=100)
Delay<-c()
for(i in 1:20){
  Delay<-c(Delay,sample(DelayA))
}
RTs<-c()
for(i in 1:4000){
  if(Delay[i]=="100"){
    RTs<-c(RTs,rnorm(1,350,50))
  } else {
    RTs<-c(RTs,rnorm(1,250,50))
  } 
}
AllData<-data.frame(Subjects,Trial,Delay,RTs) 
write.table(AllData, "DetectionData.txt", sep="\t")
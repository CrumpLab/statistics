# various illustrations of issues in statistics

# small sample size, type I error, and effect-size

all_df<-data.frame()
for(i in 1:1000){
  for(n in c(10,20,50,100,1000)){
    some_data<-rnorm(n,0.1,3)
    p_value<-t.test(some_data)$p.value
    effect_size<-mean(some_data)/sd(some_data)
    mean_scores<-mean(some_data)
    standard_error<-sd(some_data)/sqrt(length(some_data))
    t_df<-data.frame(sim=i,sample_size=n,p_value,effect_size,mean_scores,standard_error)
    all_df<-rbind(all_df,t_df)
  }
}

type_I_error <-all_df[all_df$p_value<.05,]
type_I_error$sample_size<-as.factor(type_I_error$sample_size)

ggplot(type_I_error,aes(x=p_value,y=effect_size, group=sample_size,color=sample_size))+
  geom_point()+
  theme_classic()+
  ggtitle("Effect sizes for type I errors")
  

plot(all_df[all_df$p_value<.05,]$p_value,abs(all_df[all_df$p_value<.05,]$effect_size))


# small sample size, type I error, and effect-size

all_df<-data.frame()
n<-10
for(sim in 1:1000){
  #for(n in c(10,20,50,100,1000)){
    some_data<-rnorm(n,0,1)
    p_value<-t.test(some_data)$p.value
    effect_size<-mean(some_data)/sd(some_data)
    t_df<-data.frame(sim=i,sample_size=n,p_value,effect_size)
    all_df<-rbind(all_df,t_df)
  #}
}

type_I_error <-all_df
type_I_error$sample_size<-as.factor(type_I_error$sample_size)

ggplot(type_I_error,aes(x=p_value,y=effect_size,color=sample_size))+
  geom_point()+
  theme_classic()+
  ggtitle("Effect sizes for type I errors")


## improving grades

n=40
mean_difference<-length(10000)
for(i in 1:10000){
  pop_scores<-rnorm(1000,75,20)
  pop_scores<-pop_scores[pop_scores<100]
  A<-pop_scores[1:n]
  B<-pop_scores[n+1:n*2]
  mean_difference[i]<-mean(A)-mean(B)
}
t_df<-data.frame(sims=1:10000,mean_difference)
sorted_md<-sort(mean_difference)
lower<-sorted_md[10000*.025]
upper<-sorted_md[10000*.975]

ggplot(t_df,aes(x=mean_difference))+
  geom_histogram(bins=50,color="white")+
  geom_vline(xintercept=lower)+
  geom_vline(xintercept=upper)

## real scores
library(data.table)
scores_df<-fread(file="~/Desktop/finalscores.csv")
ggplot(scores_df,aes(x=score))+
  geom_histogram(color="white")+
  facet_wrap(~year)

aggregate(score~year,scores_df,mean)

hist(scores_df$score)
mean(scores_df$score)
sd(scores_df$score)

#use test scores
scores<-scores_df$score
n=100
mean_difference<-length(10000)
for(i in 1:10000){
  A<-sample(scores,n,replace=T)
  B<-sample(scores,n,replace=T)
  mean_difference[i]<-mean(A)-mean(B)
}
t_df<-data.frame(sims=1:10000,mean_difference)
sorted_md<-sort(mean_difference)
lower<-sorted_md[10000*.025]
upper<-sorted_md[10000*.975]

ggplot(t_df,aes(x=mean_difference))+
  geom_histogram(bins=50,color="white")+
  geom_vline(xintercept=lower)+
  geom_vline(xintercept=upper)

## why is p-distribution flat
n=20
all_df<-data.frame()
for(i in 1:1000){
  for(diff in c(0,.1,.2,.3,.4,.5)){
    some_data<-rnorm(n,diff,1)
    p_value<-t.test(some_data,mu=0)$p.value
    effect_size<-mean(some_data)/sd(some_data)
    mean_scores<-mean(some_data)
    standard_error<-sd(some_data)/sqrt(length(some_data))
    t_df<-data.frame(sim=i,difference=diff,p_value,effect_size,mean_scores,standard_error)
    all_df<-rbind(all_df,t_df)
  }
}

ggplot(all_df,aes(x=p_value, group=difference, fill=difference))+
  geom_histogram(bins=20, color="white")+
  theme_classic()+facet_wrap(~difference)+
  ggtitle("Histograms of p as true effect increases")

plot(all_df[all_df$sample_size==10,]$mean_scores,all_df[all_df$sample_size==10,]$standard_error)
hist(all_df[all_df$sample_size==10,]$mean_scores)
hist(all_df[all_df$sample_size==10,]$standard_error)

some_data<-length()
for(i in 1:100000){
  some_data[i]<-t.test(rnorm(20,0,1))$statistic
}

length(some_data[some_data>0 & some_data<0.000001])
length(some_data[some_data>0 & some_data<0.00001])
length(some_data[some_data>0 & some_data<0.0001])
length(some_data[some_data>0 & some_data<0.001])
length(some_data[some_data>0 & some_data<0.01])

length(some_data[some_data>1 & some_data<1.000001])
length(some_data[some_data>1 & some_data<1.00001])
length(some_data[some_data>1 & some_data<1.0001])
length(some_data[some_data>1 & some_data<1.001])
length(some_data[some_data>1 & some_data<1.01])


##### visual anova

ss<- function(x){
  mean_x<-mean(x)
  differences<-mean_x-x
  return(sum(differences^2))
}

scores<-rnorm(9, 0, 1)
SSs<-abs(mean(scores)-scores)
rect_SS_xmin <- scores-(SSs/2)
rect_SS_xmax <- scores+(SSs/2)
rect_SS_ymin <- 0-(SSs/2)
rect_SS_ymax <- 0+(SSs/2)

groups<-rep(c("A","B","C"), each = 3)
df<-data.frame(groups,
               scores,
               SSs,
               rect_SS_xmin,
               rect_SS_xmax,
               rect_SS_ymin,
               rect_SS_ymax)

ggplot(df, aes(x=scores, y=0))+
  geom_rect(mapping=aes(xmin=mean(scores)-sum(SSs)/2, 
                        xmax=mean(scores)+sum(SSs)/2, 
                        ymin=mean(scores)-sum(SSs)/2, 
                        ymax=mean(scores)+sum(SSs)/2),fill="grey", alpha=.15)+
  geom_rect(mapping=aes(xmin=rect_SS_xmin, 
                        xmax=rect_SS_xmax, 
                        ymin=rect_SS_ymin, 
                        ymax=rect_SS_ymax, fill=groups), alpha=.25)+
  geom_point(aes(color=groups))+
  geom_point(shape="square",aes(x=mean(scores), y=0))+
  theme_classic()

### visual anova animation


all_df<-data.frame()
for (i in 1:10 ) {

scores<-rnorm(9, 0, 1)
SSs<-abs(mean(scores)-scores)
rect_SS_xmin <- scores-(SSs/2)
rect_SS_xmax <- scores+(SSs/2)
rect_SS_ymin <- 0-(SSs/2)
rect_SS_ymax <- 0+(SSs/2)

groups<-rep(c("A","B","C"), each = 3)
df<-data.frame(sims=rep(i,9),
               groups,
               scores,
               SSs,
               rect_SS_xmin,
               rect_SS_xmax,
               rect_SS_ymin,
               rect_SS_ymax)
all_df<-rbind(all_df,df)
}
  
library(gganimate)  

ggplot(all_df,aes(x=scores, y=0, frame=sims))+
  geom_rect( mapping=aes(xmin=mean(scores)-sum(SSs)/2, 
                        xmax=mean(scores)+sum(SSs)/2, 
                        ymin=mean(scores)-sum(SSs)/2, 
                        ymax=mean(scores)+sum(SSs)/2),fill="grey", alpha=.15)+
  geom_rect(mapping=aes(xmin=rect_SS_xmin, 
                        xmax=rect_SS_xmax, 
                        ymin=rect_SS_ymin, 
                        ymax=rect_SS_ymax, fill=groups), alpha=.25)+
  geom_point(aes(color=groups))+
  geom_point(shape="square",aes(x=mean(scores), y=0))+
  theme_classic()+
  transition_states(
    sims,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')


scores<-c(6,2, -3, -5)
group<-c("A","A","B","B")
SSs<-abs(mean(scores)-scores)
rect_SS_xmin <- c(0,0,-3,-5)
rect_SS_xmax <- c(6,2,0,0)
rect_SS_ymin <- 0
rect_SS_ymax <- abs(scores)
all_df<-data.frame(group,scores,
                   rect_SS_xmin,
                   rect_SS_xmax,
                   rect_SS_ymin,
                   rect_SS_ymax)

ggplot(all_df,aes(x=scores, y=0, shape=group))+
  geom_rect(mapping=aes(xmin=rect_SS_xmin, 
                        xmax=rect_SS_xmax, 
                        ymin=rect_SS_ymin, 
                        ymax=rect_SS_ymax, color="black"), alpha=.25)+
  geom_point()+
  geom_point(shape="square",aes(x=0, y=0))
  


### pvalues for 2x2x2

ps<-c()
for(i in 1:1000){
IV1<-rep(c("A","B"),each=10)
IV2<-rep(c("A","B"),10)
scores<-rnorm(20,0,1)
df<-data.frame(IV1,IV2, scores)

sum_aov<-summary(aov(scores~IV1*IV2,df))
all_ps<-sum_aov[[1]]$`Pr(>F)`[1:3]

if(length(all_ps[all_ps<0.05])>0){
ps<-c(ps,1)
}
}

sum(ps)/1000

hist(ps)


## mean stde sim

sample_mean<-length(1000)
sample_se<-length(1000)

for(i in 1:1000){
  s<-rnorm(10,0,1)
  sample_mean[i]<-mean(s)
  sample_se[i]<-sd(s)/sqrt(length(s))
}

plot(sample_mean,sample_se)
hist(sample_mean/sample_se, breaks=30)


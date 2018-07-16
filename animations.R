library(ggplot2)
library(gganimate)

# Sample normal dist--------

all_df<-data.frame()
for(sims in 1:10){
  for(n in c(10,50,100,1000)){
    sample<-rnorm(n,0,1)
    t_df<-data.frame(sims=rep(sims,n),
                     sample_size=rep(n,n),
                     sample_mean=rep(mean(sample),n),
                     sample)
    all_df<-rbind(all_df,t_df)
  }
}


ggplot(all_df, aes(x=sample))+
  geom_histogram(aes(y=..density..),color="white")+
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                lwd = .5, 
                col = 'red')+
  geom_vline(aes(xintercept=sample_mean,frame=sims),color="blue")+
  facet_wrap(~sample_size)+
  transition_states(
    sims,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

# Sample uniform dist--------

all_df<-data.frame()
for(sims in 1:10){
  for(n in c(10,50,100,1000)){
    sample<-runif(n,-1,1)
    t_df<-data.frame(sims=rep(sims,n),
                     sample_size=rep(n,n),
                     sample_mean=rep(mean(sample),n),
                     sample)
    all_df<-rbind(all_df,t_df)
  }
}


ggplot(all_df, aes(x=sample))+
  geom_histogram(aes(y=..density..),color="white")+
  stat_function(fun = dunif, 
                args = list(min=-1, max=1), 
                lwd = .5, 
                col = 'red')+
  geom_vline(aes(xintercept=sample_mean,frame=sims),color="blue")+
  facet_wrap(~sample_size)+
  transition_states(
    sims,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

# Sampling distribution of mean normal dist --------

get_sampling_means<-function(m,sd,s_size){
  save_means<-length(s_size)
  for(i in 1:s_size){
    save_means[i]<-mean(rnorm(s_size,m,sd))
  }
  return(save_means)
}

all_df<-data.frame()
for(sims in 1:10){
  for(n in c(10,50,100,1000)){
    sample<-rnorm(n,0,1)
    sample_means<-get_sampling_means(0,1,n)
    t_df<-data.frame(sims=rep(sims,n),
                     sample,
                     sample_means,
                     sample_size=rep(n,n),
                     sample_mean=rep(mean(sample),n),
                     sampling_mean=rep(mean(sample_means),n)
                     )
    all_df<-rbind(all_df,t_df)
  }
}


ggplot(all_df, aes(x=sample))+
  geom_histogram(aes(y=(..density..)/max(..density..)^.8),color="white",fill="grey")+
  geom_histogram(aes(x=sample_means,y=(..density..)/max(..density..)),fill="blue",color="white",alpha=.5)+
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                lwd = .75, 
                col = 'red')+
  geom_vline(aes(xintercept=sample_mean,frame=sims),color="red")+
  geom_vline(aes(xintercept=sampling_mean,frame=sims),color="blue")+
  facet_wrap(~sample_size)+xlim(-3,3)+
  theme_classic()+ggtitle("Population (red), Samples (grey), \n and Sampling distribution of the mean (blue)")+ylab("Rough likelihoods")+
  xlab("value")+
  transition_states(
    sims,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')


## Randomization test -------

study<-round(runif(20,70,100))
no_study<-round(runif(20,40,90))

study_df<-data.frame(student=seq(1:20),study,no_study)
mean_original<-data.frame(IV=c("studied","didnt_study"),
                          means=c(mean(study),mean(no_study)))

mean_study<-length(10)
mean_no_study<-length(10)
raw_df<-data.frame()
for(i in 1:10){
  all<-sample(c(study,no_study))
  mean_study[i]<-mean(all[1:20])
  mean_no_study[i]<-mean(all[21:40])
  t_df<-data.frame(sims=rep(i,20),
                   IV=rep(c("studied","didnt_study"),each=10),
                   values=c(all[1:20],all[21:40]))
  raw_df<-rbind(raw_df,t_df)
}

rand_df <- data.frame(sims=rep(1:10,2),means=c(mean_study,mean_no_study),
                      IV=rep(c("studied","didnt_study"),each=10))

a<-ggplot(rand_df,aes(x=IV,y=means))+
  geom_bar(data=mean_original,aes(x=IV,y=means),stat="identity",fill="blue")+
  geom_bar(stat="identity",alpha=.5)+
  theme_classic()+
  coord_cartesian(ylim=c(50, 100))+
  transition_states(
    sims,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

animate(a,nframes=50,fps=50)

a<-ggplot(rand_df,aes(x=IV,y=means,size=3))+
  geom_point(data=raw_df,aes(x=IV,y=values),alpha=.5,color="grey")+
  geom_point(data=mean_original,aes(x=IV,y=means),stat="identity",color="blue")+
  geom_point(stat="identity",color="red")+
  theme_classic(base_size = 15)+
  coord_cartesian(ylim=c(50, 100))+
  theme(legend.position="none") +
  ggtitle("Randomization test \n
          Original means (blue), 
          \n Randomized means and values (Red,Grey)")+
  transition_states(
    sims,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

animate(a,nframes=50,fps=10)



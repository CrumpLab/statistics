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

## Randomization test  better-------

study<-round(runif(10,70,100))
no_study<-round(runif(10,40,90))

study_df<-data.frame(student=seq(1:10),study,no_study)
mean_original<-data.frame(IV=c("studied","didnt_study"),
                          means=c(mean(study),mean(no_study)))
t_df<-data.frame(sims=rep(1,20),
                 IV=rep(c("studied","didnt_study"),each=10),
                 values=c(study,no_study),
                 rand_order=rep(c(0,1),each=10))

raw_df<-t_df
for(i in 2:10){
  #all<-sample(c(study,no_study))
  #mean_study[i]<-mean(all[1:20])
  #mean_no_study[i]<-mean(all[21:40])
  #t_df<-data.frame(sims=rep(i,20),
  #                 IV=rep(c("studied","didnt_study"),each=10),
  #                 values=c(all[1:20],all[21:40]))
  new_index<-sample(1:20)
  t_df$values<-t_df$values[new_index]
  t_df$rand_order<-t_df$rand_order[new_index]
  t_df$sims<-rep(i,20)
  raw_df<-rbind(raw_df,t_df)
}

raw_df$rand_order<-as.factor(raw_df$rand_order)

rand_df <- data.frame(sims=rep(1:10,2),means=c(mean_study,mean_no_study),
                      IV=rep(c("studied","didnt_study"),each=10))

a<-ggplot(raw_df,aes(x=IV,y=values,color=rand_order,size=3))+
  geom_point(stat="identity",alpha=.5)+
  geom_point(data=mean_original,aes(x=IV,y=means),stat="identity",shape=21,size=6,color="black",fill="mediumorchid2")+
  geom_point(data=rand_df,aes(x=IV,y=means),stat="identity",shape=21,size=6,color="black",fill="gold")+
  theme_classic(base_size = 15)+
  coord_cartesian(ylim=c(50, 100))+
  theme(legend.position="none") +
  ggtitle("Randomization test: Original Means (purple), 
          \n Randomized means (yellow)
          \n Original scores (red,greenish)")+
  transition_states(
    sims,
    transition_length = 1,
    state_length = 2
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

animate(a,nframes=100,fps=5)


all_df<-data.frame()
for(s_size in c(10,50,100,1000)){
  save_p<-length(10000)
  save_r<-length(10000)
  for(i in 1:10000){
    t<-cor.test(round(runif(s_size,1,10)),round(runif(s_size,1,10)))
    save_p[i]<-t$p.value
    save_r[i]<-t$estimate
  }
  t_df<-data.frame(sim=1:10000,sample_size=rep(s_size,10000),save_r,save_p)
  all_df<-rbind(all_df,t_df)
}

# concepts for inference

all_df<-data.frame()
for(i in 1:10){
  for(n in c(10,20,50,100)){
    population<-rnorm(1000,100,50)
    A<-rnorm(n,100,50)
    B<-rnorm(n,120,50)
    
    t_df<-data.frame(sim=rep(i,(1000+n+n)),
                     sample_size=rep(n,(1000+n+n)),
                     group=c(rep("population",1000),rep("A",n),rep("B",n)),
                     scores=c(population,A,B))
    all_df<-rbind(all_df,t_df)
  }
}

population<-rnorm(1000,100,50)
A<-rnorm(n,100,50)
B<-rnorm(n,120,50)

t_df<-data.frame(sim=rep(i,(1000+n+n)),
                 sample_size=rep(n,(1000+n+n)),
                 group=c(rep(1:100,each=10),rep("A",n),rep("B",n)),
                 scores=c(population,A,B))
all_df<-rbind(all_df,t_df)



ggplot(all_df[all_df$sim==1,], aes(x=group,y=scores,color=group))+
  geom_point(alpha=.5)+
  theme_classic()+
  facet_wrap(~sample_size)+
  theme(legend.position="none")


# unrelated
ggplot(all_df[all_df$save_p<.05,],aes(x=save_r))+
  geom_histogram(bins=50,color="white")+
  facet_wrap(~sample_size)+theme_classic()+
  xlab("Pearson's r")+
  ggtitle("Histograms of Pearson's r for type I errors by N")


## -- correlation uniform

all_df<-data.frame()
for(sim in 1:10){
  for(n in c(10,50,100,1000)){
    North_pole <- runif(n,1,10)
    South_pole <- runif(n,1,10)
    t_df<-data.frame(nsize=rep(n,n),
                     simulation=rep(sim,n),
                     North_pole,
                     South_pole)
    all_df<-rbind(all_df,t_df)
  }
}


ggplot(all_df,aes(x=North_pole,y=South_pole))+
  geom_point()+
  geom_smooth(method=lm, se=FALSE)+
  theme_classic()+
  facet_wrap(~nsize)+
  transition_states(
    simulation,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')


## -- correlation rnorm

all_df<-data.frame()
for(sim in 1:10){
  for(n in c(10,50,100,1000)){
    North_pole <- rnorm(n,0,1)
    South_pole <- rnorm(n,0,1)
    t_df<-data.frame(nsize=rep(n,n),
                     simulation=rep(sim,n),
                     North_pole,
                     South_pole)
    all_df<-rbind(all_df,t_df)
  }
}


ggplot(all_df,aes(x=North_pole,y=South_pole))+
  geom_point()+
  geom_smooth(method=lm, se=FALSE)+
  theme_classic()+
  facet_wrap(~nsize)+
  transition_states(
    simulation,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

## correlations with confidence----



all_df<-data.frame()
for(n in c(10,50,100,1000)){
  count_sims<-0
  for(sim in 1:1000){
    North_pole <- rnorm(n,0,1)
    South_pole <- rnorm(n,0,1)
    if(cor.test(North_pole,South_pole)$p.value<.05){
      count_sims<-count_sims+1
    t_df<-data.frame(nsize=rep(n,n),
                     simulation=rep(count_sims,n),
                     North_pole,
                     South_pole)
    all_df<-rbind(all_df,t_df)
    
    if(count_sims==10){
      break
    }
    }
  }
}


ggplot(all_df,aes(x=North_pole,y=South_pole))+
  geom_point()+
  geom_smooth(method=lm, se=TRUE)+
  theme_classic()+
  facet_wrap(~nsize)+
  transition_states(
    simulation,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')


#### regression ----

d <- mtcars
fit <- lm(mpg ~ hp, data = d)
d$predicted <- predict(fit)   # Save the predicted values
d$residuals <- residuals(fit) # Save the residual values

#ggplot(d, aes(x = hp, y = mpg)) +
#  geom_smooth(method = "lm", se = FALSE, color = "lightblue") +  # Plot regression slope
#  geom_segment(aes(xend = hp, yend = predicted, color="red"), alpha = .5) +  # alpha to fade lines
#  geom_point() +
#  geom_point(aes(y = predicted), shape = 1) +
#  theme_classic()+
#  theme(legend.position="none")+
#  xlab("X")+ylab("Y")


coefs<-coef(lm(mpg ~ hp, data = mtcars))
coefs[1]
coefs[2]

x<-d$hp
move_line<-c(seq(-6,6,.5),seq(6,-6,-.5))
total_error<-length(length(move_line))
cnt<-0
for(i in move_line){
  cnt<-cnt+1
  predicted_y <- coefs[2]*x + coefs[1]+i
  error_y <- (predicted_y-d$mpg)^2
  total_error[cnt]<-sqrt(sum(error_y)/32)
}

move_line_sims<-rep(move_line,each=32)
total_error_sims<-rep(total_error,each=32)
sims<-rep(1:50,each=32)

d<-d %>% slice(rep(row_number(), 50))

d<-cbind(d,sims,move_line_sims,total_error_sims)


anim<-ggplot(d, aes(x = hp, y = mpg, frame=sims)) +
  geom_smooth(method = "lm", se = FALSE, color = "lightblue") +  
  geom_abline(intercept = 30.09886+move_line_sims, slope = -0.06822828)+
  lims(x = c(0,400), y = c(-10,40))+
  geom_segment(aes(xend = hp, yend = predicted+move_line_sims, color="red"), alpha = .5) + 
  geom_point() +
  geom_ribbon(aes(ymin = predicted+move_line_sims - total_error_sims, ymax = predicted+move_line_sims + total_error_sims), fill = "lightgrey", alpha=.2)+ 
  #geom_point(aes(y = predicted), shape = 1) +
  theme_classic()+
  theme(legend.position="none")+
  xlab("X")+ylab("Y")+
  #transition_states(
  #  sims,
  #  transition_length = .5,
  #  state_length = 1
  #)+
  transition_manual(frames=sims)+
  enter_fade() + 
  #exit_shrink() +
  #exit_disappear(early=F)+
  exit_fade()+
  ease_aes('sine-in-out')

animate(anim,fps=5)

y=mx+b



x<-d$hp
predicted_y <- coefs[2]*x + coefs[1]+3
error_y <- (predicted_y-d$mpg)^2
total_error<-sqrt(sum(error_y)/32)

d<-cbind(d,new_error=rep(total_error,32))
plot(move_line,total_error)

y
x


## test ggpubr ----


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


a<-ggplot(all_df, aes(x=sample))+
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

b<-a

c<-ggarrange(a,b,
             ncol=2,nrow=1)
animate(ggarrange(a,b,
                  ncol=2,nrow=1),fps=5)

## correlation and effect size

## -- correlation rnorm

all_df<-data.frame()
for(sim in 1:100){
  for(n in c(10,50,100,1000)){
    North_pole <- rnorm(n,0,1)
    South_pole <- rnorm(n,0,1)
    t_df<-data.frame(nsize=n,
                     simulation=sim,
                     r= cor(North_pole,South_pole)^2,
                     p=cor.test(North_pole,South_pole)$p.value)
    all_df<-rbind(all_df,t_df)
  }
}

ggplot(all_df, aes(x=p,y=r))+
  geom_point()+
  theme_classic()+
  facet_wrap(~nsize)+
  ggtitle("r^2 as a function of p for correlations \n
          between two random normal variables (u=0, sd=1)")+
  ylab("r^2")

cor.test(North_pole,South_pole)

## correlation with cell size ----


get_sampling_means<-function(m,sd,cell_size,s_size){
  save_means<-length(s_size)
  for(i in 1:s_size){
    save_means[i]<-mean(rnorm(cell_size,m,sd))
  }
  return(save_means)
}

all_df<-data.frame()
for(n in c(1,5,10,100)){
  count_sims<-0
  for(sim in 1:10){
    North_pole <- get_sampling_means(0,1,n,10)
    South_pole <- get_sampling_means(0,1,n,10)
      count_sims<-count_sims+1
      t_df<-data.frame(nsize=rep(n,10),
                       simulation=rep(count_sims,10),
                       North_pole,
                       South_pole)
      all_df<-rbind(all_df,t_df)
  }
}


ggplot(all_df,aes(x=North_pole,y=South_pole))+
  geom_point()+
  geom_smooth(method=lm, se=TRUE)+
  theme_classic()+
  facet_wrap(~nsize)+
  ggtitle("Random scatterplots, N=10, Cell-size = 1,5,10,100")+
  transition_states(
    simulation,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')



###### cell-size correlation p r plot -----

get_sampling_means<-function(m,sd,cell_size,s_size){
  save_means<-length(s_size)
  for(i in 1:s_size){
    save_means[i]<-mean(rnorm(cell_size,m,sd))
  }
  return(save_means)
}

all_df<-data.frame()
for(n in c(1,5,10,100)){
  count_sims<-0
  for(sim in 1:100){
    North_pole <- get_sampling_means(0,1,n,10)
    South_pole <- get_sampling_means(0,1,n,10)
    count_sims<-count_sims+1
    t_df<-data.frame(cell_size=n,
                     simulation=sim,
                     r=cor(North_pole,South_pole)^2,
                     p=cor.test(North_pole,South_pole)$p.value)
    all_df<-rbind(all_df,t_df)
  }
}

all_df$cell_size<-as.factor(all_df$cell_size)
ggplot(all_df, aes(x=p,y=r, color=cell_size))+
  geom_point()+
  theme_classic()+
  ylab("r^2")+
  ggtitle("r^2 by p for correlations between random normal deviates \n
          (u=0, sd =1, N=10) as a function of cell size")


### samples and means

all_df<-data.frame()
all_df_means<-data.frame()
for(sim in 1:10){
  values<-rnorm(50*25,0,1)
  samples<-rep(seq(1:50),each=25)
  df<-data.frame(samples,values,sims=rep(sim,50*25))
  df_means<-aggregate(values~samples,df,mean, sims=rep(sim,50))
  all_df<-rbind(all_df,df)
  all_df_means<-rbind(all_df_means,df_means)
}

all_df<-cbind(all_df,means=rep(all_df_means$values,each=25))

ggplot(all_df,aes(y=values,x=samples))+
  geom_point(aes(color=abs(values)), alpha=.25)+
  geom_point(aes(y=means,x=samples),color="red")+
  theme_classic()+
  theme(legend.position="none") +
  transition_states(
    sims,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

### samples and means some differences

all_df<-data.frame()
all_df_means<-data.frame()
for(sim in 1:10){
  values<-c(rnorm(50*25,0,1),rnorm(25*25,0,1),rnorm(25*25,.5,1))
  samples<-c(rep(seq(1:50),each=25),rep(seq(1:50),each=25))
  df<-data.frame(samples,values,sims=rep(sim,50*25*2),type=rep(c("null","true"),each=50*25))
  df_means<-aggregate(values~samples*type,df,mean, sims=rep(sim,50))
  all_df<-rbind(all_df,df)
  all_df_means<-rbind(all_df_means,df_means)
}

all_df<-cbind(all_df,means=rep(all_df_means$values,each=25))

ggplot(all_df,aes(y=values,x=samples))+
  geom_point(aes(color=abs(values)), alpha=.25)+
  geom_point(aes(y=means,x=samples),color="red")+
  theme_classic()+
  geom_vline(xintercept=25.5)+
  theme(legend.position="none") +
  facet_wrap(~type,ncol=1,nrow=2)+
  ggtitle("true samples (26-50) have .5 mean difference from 0 \n
          samples(1-25) have mean 0")+
  transition_states(
    sims,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

### samples and means some  moving differences

all_df<-data.frame()
all_df_means<-data.frame()
dif_sim<-seq(-1.5,1.5,.25)
for(sim in 1:13){
  values<-c(rnorm(25*25,0,1),rnorm(25*25,dif_sim[sim],1))
  samples<-c(rep(seq(1:25),each=25),rep(seq(1:25),each=25))
  df<-data.frame(samples,values,sims=rep(sim,50*25),type=rep(c("null","true"),each=25))
  df_means<-aggregate(values~samples*type,df,mean, sims=rep(sim,50))
  all_df<-rbind(all_df,df)
  all_df_means<-rbind(all_df_means,df_means)
}

all_df<-cbind(all_df,means=rep(all_df_means$values,each=25))

ggplot(all_df,aes(y=values,x=samples))+
  geom_point(aes(color=abs(values)), alpha=.25)+
  geom_point(aes(y=means,x=samples),color="red")+
  theme_classic()+
  geom_vline(xintercept=25.5)+
  facet_wrap(~type)+
  geom_hline(yintercept=0)+
  theme(legend.position="none") +
  ggtitle("null=0, True effect moves from -1.5 sd to 1.5 sd")+
  transition_states(
    sims,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

### Null and True effect samples and sampling means violin

The null dots show 50 different samples, with the red dot as the mean for each sample. Null dots are all sampled from normal (u=0, sd=1). The true dots show 50 more samples, with red dots for their means. However, the mean of the true shifts between -1.5 and +1.5 standard deviations of 0. This illustrates how a true effect moves in and out of the null range.

#```{r, echo=F,eval=T}
knitr::include_graphics(path="gifs/sampleNullTrue-1.gif")
#```

#```{r sampleNullTrue,echo=T, fig.path='gifs/', message=F, warning=F, eval=F}
n_samp<-10
all_df<-data.frame()
all_df_means<-data.frame()
dif_sim<-seq(-1.5,1.5,.25)
for(sim in 1:13){
  values<-c(rnorm(25*n_samp,0,1),rnorm(25*n_samp,dif_sim[sim],1))
  samples<-c(rep(seq(1:n_samp),each=25),rep(seq(1:n_samp),each=25))
  df<-data.frame(samples,values,sims=rep(sim,n_samp*2*25),type=rep(c("null","true"),each=25*n_samp))
  df_means<-aggregate(values~samples*type,df,mean, sims=rep(sim,n_samp*2))
  all_df<-rbind(all_df,df)
  all_df_means<-rbind(all_df_means,df_means)
}

all_df<-cbind(all_df,means=rep(all_df_means$values,each=25))

ggplot(all_df,aes(y=values,x=samples, group=samples))+
  geom_hline(yintercept=0)+
  scale_fill_gradientn(colours = rainbow(5))+
  scale_color_gradientn(colours = rainbow(10))+
  geom_violin(aes(fill=abs(means)),scale="width", alpha=.5)+
  geom_point(aes(color=abs(values)), alpha=.5)+
  geom_point(aes(y=means,x=samples),color="red")+
  theme_classic()+
  facet_wrap(~type, nrow=2)+
  theme(legend.position="none") +
  ggtitle("Flight of the dots played by Violin Orchestra")+
  transition_states(
    sims,
    transition_length = 2,
    state_length = 1
  )+enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')


## changing sd ----

some_sds<-seq(0.5,5,.5)
all_df<-data.frame()
for(i in 1:10){
  rnorm_vec <- rnorm(1000,mean=0,sd=some_sds[i])
  sds <- rep(some_sds[i], 1000)
  sims <- rep(i, 1000)
  t_df<-data.frame(sims,sds,rnorm_vec)
  all_df<-rbind(all_df,t_df)
}

labs_df<-data.frame(sims=1:10,
                    sds=as.character(seq(0.5,5,.5)))

ggplot(all_df, aes(x=rnorm_vec, frame=sims))+
  geom_histogram(bins=50, color="white")+
  theme_classic()+
  ylab("count")+
  xlab("value")+
  ggtitle("Histogram with increasing standard deviation")+
  geom_label(data = labs_df, aes(x = 5, y = 200, label = sds))+
  transition_states(
    sims,
    transition_length = 2,
    state_length = 1
  )+
  enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')





  








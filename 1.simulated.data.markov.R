
setwd("/multi_state")

#When β = 1 , the Weibull distribution reduces to the exponential distribution 
#The parameter β is a shape parameter affecting the shape of the distribution, 
#with the identification of the exponential parameter λ with 1 / α . 
#while α is a scaling parameter affecting the scale.

r01=0.2
r02=0.3
r03=0.3
r04=0.2

r12=0.4
r13=0.3
r14=0.3

r23=0.5
r24=0.5

r34=0.5

paper_simu=500

for (ps in 1:paper_simu){
  
library(survsim)

df0 <- crisk.sim(n= 2000, foltime=100, 
                      nsit=4, dist.ev=c("weibull","weibull","weibull","weibull"),
                      anc.ev=c(1, 1, 1, 1),  ##anc.ev is the shape
                      beta0.ev=c(-log(r01),-log(r02),-log(r03),-log(r04)) , ##beta0.ev is the scale, 1/rate 
                      dist.cens="weibull", anc.cens=1,beta0.cens=6)
table(df0$cause)

library(dplyr)

df0 = subset(df0, select = c(nid,cause,time) )

df0<-df0 %>% dplyr::rename(ID = nid,
              status1=cause,
              tte1=time)

df0$Tstart1=0
df0$Tstop1=df0$tte1

df0[which(is.na(df0$status1)==T),]$status1<-0

table(df0$status1)
summary(df0$tte1)

##simulate the next state

df1_before<-df0[which(df0$status1==1),]

df1_n=nrow(df1_before)

df1_after <- crisk.sim(n=df1_n, foltime=100, 
                       nsit=3, dist.ev=c("weibull","weibull","weibull"),
                       anc.ev=c(1,1,1),  ##anc.ev is the shape
                       beta0.ev=c(-log(r12), -log(r13), -log(r14)), ##beta0.ev is the scale, 1/rate 
                       dist.cens="weibull", anc.cens=1,beta0.cens=6)
library(dplyr)

df1_after = subset(df1_after, select = c(nid,cause,time) )

df1_after<-df1_after %>% dplyr::rename(ID = nid,
                                tte2=time)

df1_after$Tstart2=0
df1_after$Tstop2=df1_after$tte2

df1_after$status2=df1_after$cause+1

df1_after<-df1_after%>%
  mutate(
    status2 = case_when(
      is.na(status2)==T ~1 ,
      TRUE ~ status2
    ),
  )

df1_after = subset(df1_after, select = -c(cause, ID) )

table(df1_after$status2)

colnames(df1_before)
colnames(df1_after)

##randomly combine past state and current state
df1 <- cbind(df1_before, df1_after)      

#library(tidyverse)
#mesa_all=df_list %>% reduce(full_join, by='ID')

##simulate y3

df2_before1=df0[which(df0$status1==2),]

df2_before2=df1[which(df1$status2==2),]

colnames(df2_before1)

colnames(df2_before2)

library(dplyr)

df2_before=bind_rows(df2_before1,df2_before2)

df2_n=nrow(df2_before)

df2_after <- crisk.sim(n=df2_n, foltime=100, 
                       nsit=2, dist.ev=c("weibull","weibull"),
                       anc.ev=c(1,1),  ##anc.ev is the shape
                       beta0.ev=c(-log(r23), -log(r24)), ##beta0.ev is the scale, 1/rate 
                       dist.cens="weibull", anc.cens=1,beta0.cens=6)

library(dplyr)

df2_after = subset(df2_after, select = c(nid,cause,time) )

df2_after<-df2_after %>% dplyr::rename(ID = nid,
                                tte3=time)

df2_after$Tstart3=0
df2_after$Tstop3=df2_after$tte3

df2_after$status3=df2_after$cause+2

df2_after<-df2_after%>%
  mutate(
    status3 = case_when(
      is.na(status3)==T ~2 ,
      TRUE ~ status3
    ),
  )

df2_after = subset(df2_after, select = -c(cause, ID) )

##randomly combine past state and current state

df2 <- cbind(df2_before, df2_after)      

df2[1,]

##simulate y4

df3_before1=df0[which(df0$status1==3),]
##status1=3

df3_before2=df1[which(df1$status2==3),]  
##status1=1, status2=3

df3_before3=df2[which(df2$status3==3),]  
##status1=1, status2=2, status3=3 or status1=2, status2=NA, status3=3

df2
colnames(df3_before1)

colnames(df3_before2)

colnames(df3_before3)

df3_before=bind_rows(df3_before1,df3_before2,df3_before3)

df3_n=nrow(df3_before1)+nrow(df3_before2)+nrow(df3_before3)

df3_after <- crisk.sim(n=df3_n, foltime=100, 
                       nsit=1, dist.ev=c("weibull"),
                       anc.ev=c(1),  ##anc.ev is the shape
                       beta0.ev=c(-log(r34)), ##beta0.ev is the scale, 1/rate 
                       dist.cens="weibull", anc.cens=1,beta0.cens=6)
library(dplyr)

df3_after = subset(df3_after, select = c(nid,cause,time) )

df3_after<-df3_after %>% dplyr::rename(ID = nid,
                                tte4=time)

df3_after$Tstart4=0
df3_after$Tstop4=df3_after$tte4

df3_after$status4=df3_after$cause+3

df3_after<-df3_after%>%
  mutate(
    status4 = case_when(
      is.na(status4)==T ~3 ,
      TRUE ~ status4
    ),
  )

table(df3_after$status4)


df3_after = subset(df3_after, select = -c(cause, ID) )

##randomly combine past state and current state

df3 <- cbind(df3_before, df3_after)      

df3[1,]


##combine the data

df0_for_c<-data.frame(df0)
df1_for_c<-subset(data.frame(df1), select=-c(status1,tte1, Tstart1,Tstop1))
df2_for_c<-subset(data.frame(df2), select=-c(status1,tte1, Tstart1,Tstop1,
                                 status2,tte2, Tstart2,Tstop2))
df3_for_c<-subset(data.frame(df3), select=-c(status1,tte1, Tstart1,Tstop1,
                                 status2,tte2, Tstart2,Tstop2,
                                 status3,tte3, Tstart3,Tstop3))


df0_for_c$marker1=1
df1_for_c$marker2=1
df2_for_c$marker3=1
df3_for_c$marker4=1


library(tidyverse)
df_list <- list(df0_for_c, df1_for_c,df2_for_c,df3_for_c)

df_all=Reduce(function(x, y) merge(x, y,by="ID",all.x=T), df_list)


write.table(df_all, file=paste0("data_all",ps,".txt"))


}




setwd("./5.constant.markov.data")

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

paper_simu=1000

for (ps in 1:paper_simu){
  
library(survsim)

df0 <- crisk.sim(n=5000, foltime=100, 
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

##subset datasets

##state 0 

data0=df0
data0$tte<-data0$tte1
data0$S0_y<-data0$status1


data0<-data0%>%
  mutate(
    S0_ylong = case_when(
      S0_y>=1 ~ 1,
      S0_y==0 ~ 0,
      TRUE ~ NA
    ),
  )


table(data0$S0_ylong) 
table(data0$S0_y)

summary(data0$S0_ylong) 
summary(data0$S0_y)

##state 1 

data1=df1
data1$tte<-data1$tte2
summary(data1$tte2)

data1$S1_y<-data1$status2

data1<-data1%>%
  mutate(
    S1_ylong = case_when(
      S1_y>=2 ~ 1,
      S1_y==1 ~ 0,
      TRUE ~ NA
    ),
  )

table(data1$S1_ylong)  
table(data1$S1_y)


##state 2

data2=df2

data2 <- data2 %>%
  mutate(tte = tte3,
         
         S2_y =status3,
         
         S2_ylong = case_when(
           S2_y>=3 ~ 1,
           S2_y==2 ~ 0,
           TRUE ~ NA
  )
  )

summary(data2$tte)

table(data2$S2_ylong) 
table(data2$S2_y)

##state 3

data3=df3

data3 <- data3 %>%
  mutate(tte = tte4,
         
         S3_y =status4,
         
         S3_ylong = case_when(
           S3_y>=4 ~ 1,
           S3_y==3 ~ 0,
           TRUE ~ NA
         )
  )


table(data3$S3_ylong)  
table(data3$S3_y)


write.table(data0, file=paste0("data0_",ps,".txt"))
write.table(data1, file=paste0("data1_",ps,".txt"))
write.table(data2, file=paste0("data2_",ps,".txt"))
write.table(data3, file=paste0("data3_",ps,".txt"))


}

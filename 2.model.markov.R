library(dplyr) 
library(riskRegression, verbose = FALSE, quietly = TRUE)
library(survival)
library(Hmisc)
library(rms)
library(splines)
library(ggplot2)

start <- Sys.time() 

setwd("/multi_state")

setwd("./0.5k.markov.data/R2.data")
break_interval=0.1

#setwd("./5.constant.nonmarkov.data")
#break_interval=0.1

#setwd("./5.nonconstant.markov.data")
#break_interval=0.05

#setwd("./5.nonconstant.nonmarkov.data")
#break_interval=0.05


fup_time=1.5

analysis_interval=fup_time/break_interval

simu_start=1

simu_end=100

var_loop=1000  ##loop of bootstrap


df_all_read_all = stringr::str_sort(list.files(pattern="data_all.*txt",  full.names=TRUE), num = TRUE)

library(riskRegression, verbose = FALSE, quietly = TRUE)
library(survival)
library("Hmisc")
library("rms")
library("splines")
library("ggplot2")

for (ps in simu_start:simu_end){


  df_all_for_B<-read.table(df_all_read_all[ps])
  

##bootstrap 

  TR_var <- list()  
  TP_var <- list()  
  SOP_var <- list()  
  
for (simu in 1:var_loop){


df_all<-df_all_for_B[sample(1:nrow(df_all_for_B), size=nrow(df_all_for_B), replace=TRUE),]



##subset datasets

##state 0 

data0<-df_all[which(df_all$marker1==1),]
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

data1<-df_all[which(df_all$marker2==1),]
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

data2<-df_all[which(df_all$marker3==1),]

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

data3<-df_all[which(df_all$marker4==1),]

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



  ##change data from wide to long

  library(survival)
  
  data0_t=round(max(data0$tte), digits = 0)+1
  data1_t=round(max(data1$tte), digits = 0)+1
  data2_t=round(max(data2$tte), digits = 0)+1
  data3_t=round(max(data3$tte), digits = 0)+1
  
  data0_long <- survSplit(Surv(tte, S0_ylong)~.,
                          data = data0,
                          cut = c(0:data0_t, breaks = break_interval*(0:data0_t)),   
                          episode="interval",
                          start="tstart",
                          end = "tstop")
  data0_long=data.frame(data0_long)
  data0_long$interval=data0_long$interval-1
  
  
  data1_long <- survSplit(Surv(tte, S1_ylong)~.,
                          data = data1,
                          cut = c(0:data1_t, breaks = break_interval*(0:data1_t)),   
                          episode="interval",
                          start="tstart",
                          end = "tstop")
  
  data1_long=data.frame(data1_long)
  data1_long$interval=data1_long$interval-1
  
  data2_long <- survSplit(Surv(tte, S2_ylong)~.,
                          data = data2,
                          cut = c(0:data2_t, breaks = break_interval*(0:data2_t)),   
                          episode="interval",
                          start="tstart",
                          end = "tstop")
  
  data2_long=data.frame(data2_long)
  data2_long$interval=data2_long$interval-1
  
  data3_long <- survSplit(Surv(tte, S3_ylong)~.,
                          data = data3,
                          cut = c(0:data3_t, breaks = break_interval*(0:data3_t)),   
                          episode="interval",
                          start="tstart",
                          end = "tstop")
  
  data3_long=data.frame(data3_long)
  data3_long$interval=data3_long$interval-1
  
  
  table(data0_long$interval)
  table(data1_long$interval)
  table(data2_long$interval)
  table(data3_long$interval)
  
  
  ##derive longitiduanal outcomes
  
  data0_long$S0_mylong<-0
  data0_long[which(data0_long$S0_y==1 & data0_long$S0_ylong==1),]$S0_mylong<-1
  data0_long[which(data0_long$S0_y==2 & data0_long$S0_ylong==1),]$S0_mylong<-2
  data0_long[which(data0_long$S0_y==3 & data0_long$S0_ylong==1),]$S0_mylong<-3
  data0_long[which(data0_long$S0_y==4 & data0_long$S0_ylong==1),]$S0_mylong<-4
  
  
  data1_long$S1_mylong<-0
  data1_long[which(data1_long$S1_y==2 & data1_long$S1_ylong==1),]$S1_mylong<-2
  data1_long[which(data1_long$S1_y==3 & data1_long$S1_ylong==1),]$S1_mylong<-3
  data1_long[which(data1_long$S1_y==4 & data1_long$S1_ylong==1),]$S1_mylong<-4
  
  
  data2_long$S2_mylong<-0
  data2_long[which(data2_long$S2_y==3 & data2_long$S2_ylong==1),]$S2_mylong<-3
  data2_long[which(data2_long$S2_y==4 & data2_long$S2_ylong==1),]$S2_mylong<-4
  
  data3_long$S3_mylong<-0
  data3_long[which(data3_long$S3_y==4 & data3_long$S3_ylong==1),]$S3_mylong<-4
  
  
  data0_long = subset(data0_long, select = c(ID, S0_mylong, tstart, tstop, interval, status1, tte1) )
  data1_long = subset(data1_long, select = c(ID, S1_mylong, tstart, tstop, interval, status1, tte1, status2, tte2) )
  data2_long = subset(data2_long, select = c(ID, S2_mylong, tstart, tstop, interval, status1, tte1, status2, tte2, status3, tte3) )
  data3_long = subset(data3_long, select = c(ID, S3_mylong, tstart, tstop, interval, status1, tte1, status2, tte2, status3, tte3, status4, tte4) )
  
  
  library(dplyr)
  

  data0_long <- data0_long %>%
    mutate(
      
      tte_cmr=tstop-tstart,
      
      S0_y_1 = case_when(
        S0_mylong==1 ~ 1,
        TRUE ~ 0
      ),
      S0_y_2 = case_when(
        S0_mylong==2 ~ 1,
        TRUE ~ 0
      ),
      S0_y_3 = case_when(
        S0_mylong==3 ~ 1,
        TRUE ~ 0
      ),
      S0_y_4 = case_when(
        S0_mylong==4 ~ 1,
        TRUE ~ 0
      )
    )
  
  
  data1_long<-data1_long %>%
    mutate(
      
      tte_cmr=tstop-tstart,
     
      S1_y_2 = case_when(
        S1_mylong==2 ~ 1,
        TRUE ~ 0
      ),
      
      S1_y_3 = case_when(
        S1_mylong==3 ~ 1,
        TRUE ~ 0
      ),
      
      
      S1_y_4 = case_when(
        S1_mylong==4 ~ 1,
        TRUE ~ 0
      ) 
    )
  
  data2_long<-data2_long %>%
    mutate(
      
      tte_cmr=tstop-tstart,
      
      S2_y_3 = case_when(
        S2_mylong==3 ~ 1,
        TRUE ~ 0
      ),
      
      S2_y_4 = case_when(
        S2_mylong==4 ~ 1,
        TRUE ~ 0
      ),
      
      sub2=case_when (
        status1==1 & status2==2 ~ "htn-chd",
        status1==2 & is.na(status2)==T ~ "well-chd"),
    )
  
  
  data3_long<-data3_long %>%
    mutate(
      
      tte_cmr=tstop-tstart,
      
      S3_y_4=case_when(
        S3_mylong==4 ~ 1,
        TRUE~0
      ),
      
      sub3=case_when (
        status1==1 & status2==2 & status3==3 ~ "htn-chd-chf",
        status1==1 & status2==3 & is.na(status3)==T ~ "htn-chf",
        status1==2 & is.na(status2)==T & status3==3 ~ "chd-chf",
        status1==3 ~ "chf"
      )
      
    )
  

##data 0

  cfit0 <- CSC(formula = list(Hist(tte_cmr,S0_mylong) ~ rcs(interval,4)), data = data0_long)
  
  new_data0=data.frame(c(1:analysis_interval))
  colnames(new_data0)=c("interval")
  
  pfit01 <- predict(cfit0, newdata = new_data0, cause = 1, times =break_interval, se = F, keep.newdata = FALSE)
  pfit02 <- predict(cfit0, newdata = new_data0, cause = 2, times =break_interval, se = F, keep.newdata = FALSE)
  pfit03 <- predict(cfit0, newdata = new_data0, cause = 3, times =break_interval, se = F, keep.newdata = FALSE)
  pfit04 <- predict(cfit0, newdata = new_data0, cause = 4, times =break_interval, se = F, keep.newdata = FALSE)
  
  predict0<-data.frame(new_data0$interval, 
pfit01$absRisk,  
pfit02$absRisk, 
pfit03$absRisk, 
pfit04$absRisk)
  
  colnames(predict0)=c("interval", "r01", "r02", "r03", "r04")
  
  

##data1
  
  
  cfit1 <- CSC(formula = list(Hist(tte_cmr,S1_mylong) ~ rcs(interval,4) ), data = data1_long)
  
  pfit12 <- predict(cfit1, newdata = new_data0, cause = 2, times =break_interval, se = F, keep.newdata = FALSE)
  pfit13 <- predict(cfit1, newdata = new_data0, cause = 3, times =break_interval, se = F, keep.newdata = FALSE)
  pfit14 <- predict(cfit1, newdata = new_data0, cause = 4, times =break_interval, se = F, keep.newdata = FALSE)
  
  predict1<-data.frame(new_data0$interval, 
                pfit12$absRisk,  
                pfit13$absRisk,  
                pfit14$absRisk)
  
  colnames(predict1)=c("interval","r12","r13","r14")
  
  

###data 2
  
  cfit2 <- CSC(formula = list(Hist(tte_cmr,S2_mylong) ~ 
                                rcs(interval,3)), data = data2_long)
  
  new_data2<-NA
  new_data2=data.frame(c(1:analysis_interval))
  colnames(new_data2)=c("interval")
  
  
  pfit23 <- predict(cfit2, newdata = new_data2, cause = 3, times =break_interval, se = F, keep.newdata = FALSE)
  pfit24 <- predict(cfit2, newdata = new_data2, cause = 4, times =break_interval, se = F, keep.newdata = FALSE)
  
  predict2<-data.frame(new_data2$interval,  
                pfit23$absRisk, 
                pfit24$absRisk)
  
  colnames(predict2)=c("interval","r23", "r24")
  
  predict2_0=predict2
  
  predict2_1=predict2
  

##data3

  cfit34 <- coxph(Surv(tte_cmr,S3_y_4) ~ 
                  rcs(interval,4), 
                  data = data3_long, x = TRUE)
  
  new_data3<-NA
  new_data3=data.frame(c(1:analysis_interval))
  colnames(new_data3)=c("interval")

  pfit34 <- predictCox(cfit34, newdata=new_data3, times=break_interval, se = F)
  
  predict3<-data.frame(new_data3$interval, 
                       pfit34$survival)
  
  colnames(predict3)=c("interval", 
                       "r34_s") 
  
  predict3<-predict3 %>%
    mutate(
      
      ###convert predicted probability into hazard
      
      r34=(1-r34_s)
      ) 

  predict3_0=predict3
  
  predict3_01=predict3
  
  predict3_02=predict3
  
  predict3_012=predict3
  
  

    for (t in 1:analysis_interval) {
      
      TR_var[[t+(simu-1)*analysis_interval]]=matrix(0, nrow=9, ncol=9)
      
      TR_var[[t+(simu-1)*analysis_interval]][1,2]=predict0$r01[t]
      TR_var[[t+(simu-1)*analysis_interval]][1,3]=predict0$r02[t]
      TR_var[[t+(simu-1)*analysis_interval]][1,5]=predict0$r03[t]
      TR_var[[t+(simu-1)*analysis_interval]][1,9]=predict0$r04[t]
      
      
      TR_var[[t+(simu-1)*analysis_interval]][2,4]=predict1$r12[t]
      TR_var[[t+(simu-1)*analysis_interval]][2,6]=predict1$r13[t]
      TR_var[[t+(simu-1)*analysis_interval]][2,9]=predict1$r14[t]
      
      TR_var[[t+(simu-1)*analysis_interval]][3,7]=predict2_0$r23[t]
      TR_var[[t+(simu-1)*analysis_interval]][3,9]=predict2_0$r24[t]
      
      TR_var[[t+(simu-1)*analysis_interval]][4,8]=predict2_1$r23[t]
      TR_var[[t+(simu-1)*analysis_interval]][4,9]=predict2_1$r24[t]
      
      TR_var[[t+(simu-1)*analysis_interval]][5,9]=predict3_0$r34[t]
      
      TR_var[[t+(simu-1)*analysis_interval]][6,9]=predict3_01$r34[t]
      
      TR_var[[t+(simu-1)*analysis_interval]][7,9]=predict3_02$r34[t]
      
      TR_var[[t+(simu-1)*analysis_interval]][8,9]=predict3_012$r34[t]
      
      
      
      
      TR_var[[t+(simu-1)*analysis_interval]][1,1]=-sum(TR_var[[t+(simu-1)*analysis_interval]][1,2:9])
      TR_var[[t+(simu-1)*analysis_interval]][2,2]=-sum(TR_var[[t+(simu-1)*analysis_interval]][2,3:9])
      TR_var[[t+(simu-1)*analysis_interval]][3,3]=-sum(TR_var[[t+(simu-1)*analysis_interval]][3,4:9])
      TR_var[[t+(simu-1)*analysis_interval]][4,4]=-sum(TR_var[[t+(simu-1)*analysis_interval]][4,5:9])
      TR_var[[t+(simu-1)*analysis_interval]][5,5]=-sum(TR_var[[t+(simu-1)*analysis_interval]][5,6:9])
      TR_var[[t+(simu-1)*analysis_interval]][6,6]=-sum(TR_var[[t+(simu-1)*analysis_interval]][6,7:9])
      TR_var[[t+(simu-1)*analysis_interval]][7,7]=-sum(TR_var[[t+(simu-1)*analysis_interval]][7,8:9])
      TR_var[[t+(simu-1)*analysis_interval]][8,8]=-sum(TR_var[[t+(simu-1)*analysis_interval]][8,9:9])
      
    }
    
    
    #transition probability
    
    I=diag(nrow=9)
    
    TP_var[[1+(simu-1)*analysis_interval]]=I+TR_var[[1+(simu-1)*analysis_interval]]
    
    #state occupational probability
    
    SOP_var_0=c(1, 0, 0, 0, 0, 0, 0, 0, 0)
    
    SOP_var[[1+(simu-1)*analysis_interval]]=SOP_var_0%*%(I+TR_var[[1+(simu-1)*analysis_interval]])
    
    
    for (t in 2:analysis_interval) {
      
      TP_var[[t+(simu-1)*analysis_interval]]=TP_var[[t+(simu-1)*analysis_interval-1]]%*%(I+TR_var[[t+(simu-1)*analysis_interval]])
      
      SOP_var[[t+(simu-1)*analysis_interval]]=SOP_var[[t+(simu-1)*analysis_interval-1]]%*%(I+TR_var[[t+(simu-1)*analysis_interval]])
      
    }
    
    
  }  ##end of the bootstrap
  
  rowSums(TP_var[[3]]*100)  ##100
  
  
  #organize the results from the 1000 bootstrap
  
  ##transition rates
  
  TR_var_11=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_12=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_13=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_14=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_15=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_16=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_17=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_18=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_19=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TR_var_22=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_23=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_24=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_25=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_26=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_27=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_28=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_29=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TR_var_33=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_34=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_35=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_36=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_37=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_38=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_39=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TR_var_44=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_45=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_46=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_47=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_48=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_49=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TR_var_55=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_56=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_57=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_58=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_59=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TR_var_66=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_67=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_68=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_69=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TR_var_77=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_78=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_79=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TR_var_88=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TR_var_89=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TR_var_99=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  ##transition probability
  
  TP_var_11=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_12=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_13=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_14=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_15=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_16=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_17=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_18=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_19=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TP_var_22=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_23=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_24=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_25=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_26=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_27=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_28=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_29=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TP_var_33=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_34=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_35=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_36=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_37=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_38=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_39=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TP_var_44=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_45=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_46=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_47=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_48=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_49=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TP_var_55=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_56=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_57=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_58=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_59=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TP_var_66=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_67=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_68=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_69=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TP_var_77=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_78=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_79=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TP_var_88=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  TP_var_89=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  TP_var_99=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  
  ##state occupational probability
  
  SOP_var_1=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  SOP_var_2=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  SOP_var_3=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  SOP_var_4=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  SOP_var_5=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  SOP_var_6=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  SOP_var_7=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  SOP_var_8=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  SOP_var_9=matrix(NA, nrow=var_loop,ncol=analysis_interval)
  
  
  for (simu in 1:var_loop) {
    
    for (t in 1:analysis_interval) {
      
      ##transition rates
      
      TR_var_11[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][1,1]
      TR_var_12[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][1,2]
      TR_var_13[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][1,3]
      TR_var_14[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][1,4]
      TR_var_15[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][1,5]
      TR_var_16[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][1,6]
      TR_var_17[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][1,7]
      TR_var_18[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][1,8]
      TR_var_19[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][1,9]
      
      TR_var_22[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][2,2]
      TR_var_23[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][2,3]
      TR_var_24[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][2,4]
      TR_var_25[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][2,5]
      TR_var_26[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][2,6]
      TR_var_27[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][2,7]
      TR_var_28[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][2,8]
      TR_var_29[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][2,9]
      
      TR_var_33[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][3,3]
      TR_var_34[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][3,4]
      TR_var_35[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][3,5]
      TR_var_36[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][3,6]
      TR_var_37[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][3,7]
      TR_var_38[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][3,8]
      TR_var_39[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][3,9]
      
      TR_var_44[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][4,4]
      TR_var_45[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][4,5]
      TR_var_46[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][4,6]
      TR_var_47[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][4,7]
      TR_var_48[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][4,8]
      TR_var_49[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][4,9]
      
      TR_var_55[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][5,5]
      TR_var_56[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][5,6]
      TR_var_57[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][5,7]
      TR_var_58[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][5,8]
      TR_var_59[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][5,9]
      
      TR_var_66[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][6,6]
      TR_var_67[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][6,7]
      TR_var_68[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][6,8]
      TR_var_69[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][6,9]
      
      TR_var_77[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][7,7]
      TR_var_78[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][7,8]
      TR_var_79[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][7,9]
      
      TR_var_88[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][8,8]
      TR_var_89[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][8,9]
      
      TR_var_99[simu,t]=TR_var[[t+(simu-1)*analysis_interval]][9,9]
      
      ##transition probability
      
      TP_var_11[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][1,1]
      TP_var_12[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][1,2]
      TP_var_13[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][1,3]
      TP_var_14[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][1,4]
      TP_var_15[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][1,5]
      TP_var_16[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][1,6]
      TP_var_17[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][1,7]
      TP_var_18[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][1,8]
      TP_var_19[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][1,9]
      
      TP_var_22[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][2,2]
      TP_var_23[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][2,3]
      TP_var_24[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][2,4]
      TP_var_25[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][2,5]
      TP_var_26[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][2,6]
      TP_var_27[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][2,7]
      TP_var_28[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][2,8]
      TP_var_29[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][2,9]
      
      TP_var_33[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][3,3]
      TP_var_34[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][3,4]
      TP_var_35[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][3,5]
      TP_var_36[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][3,6]
      TP_var_37[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][3,7]
      TP_var_38[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][3,8]
      TP_var_39[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][3,9]
      
      TP_var_44[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][4,4]
      TP_var_45[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][4,5]
      TP_var_46[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][4,6]
      TP_var_47[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][4,7]
      TP_var_48[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][4,8]
      TP_var_49[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][4,9]
      
      TP_var_55[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][5,5]
      TP_var_56[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][5,6]
      TP_var_57[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][5,7]
      TP_var_58[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][5,8]
      TP_var_59[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][5,9]
      
      TP_var_66[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][6,6]
      TP_var_67[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][6,7]
      TP_var_68[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][6,8]
      TP_var_69[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][6,9]
      
      TP_var_77[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][7,7]
      TP_var_78[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][7,8]
      TP_var_79[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][7,9]
      
      TP_var_88[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][8,8]
      TP_var_89[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][8,9]
      
      TP_var_99[simu,t]=TP_var[[t+(simu-1)*analysis_interval]][9,9]
      
      
      ##state occupational probability
      
      SOP_var_1[simu,t]=SOP_var[[t+(simu-1)*analysis_interval]][1,1] 
      SOP_var_2[simu,t]=SOP_var[[t+(simu-1)*analysis_interval]][1,2]  
      SOP_var_3[simu,t]=SOP_var[[t+(simu-1)*analysis_interval]][1,3]  
      SOP_var_4[simu,t]=SOP_var[[t+(simu-1)*analysis_interval]][1,4]  
      SOP_var_5[simu,t]=SOP_var[[t+(simu-1)*analysis_interval]][1,5]  
      SOP_var_6[simu,t]=SOP_var[[t+(simu-1)*analysis_interval]][1,6]  
      SOP_var_7[simu,t]=SOP_var[[t+(simu-1)*analysis_interval]][1,7]  
      SOP_var_8[simu,t]=SOP_var[[t+(simu-1)*analysis_interval]][1,8]  
      SOP_var_9[simu,t]=SOP_var[[t+(simu-1)*analysis_interval]][1,9]  
      
      
    }
    
  }
  
  
  TR_11_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_12_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_13_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_14_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_15_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_16_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_17_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_18_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_19_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TR_22_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_23_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_24_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_25_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_26_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_27_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_28_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_29_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TR_33_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_34_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_35_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_36_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_37_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_38_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_39_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TR_44_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_45_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_46_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_47_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_48_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_49_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TR_55_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_56_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_57_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_58_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_59_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TR_66_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_67_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_68_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_69_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TR_77_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_78_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_79_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TR_88_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TR_89_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TR_99_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  
  
  TP_11_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_12_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_13_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_14_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_15_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_16_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_17_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_18_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_19_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TP_22_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_23_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_24_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_25_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_26_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_27_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_28_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_29_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TP_33_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_34_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_35_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_36_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_37_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_38_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_39_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TP_44_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_45_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_46_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_47_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_48_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_49_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TP_55_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_56_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_57_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_58_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_59_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TP_66_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_67_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_68_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_69_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TP_77_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_78_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_79_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TP_88_final=matrix(NA, ncol=3,nrow=analysis_interval)
  TP_89_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  TP_99_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  
  SOP_1_final=matrix(NA, ncol=3,nrow=analysis_interval)
  SOP_2_final=matrix(NA, ncol=3,nrow=analysis_interval)
  SOP_3_final=matrix(NA, ncol=3,nrow=analysis_interval)
  SOP_4_final=matrix(NA, ncol=3,nrow=analysis_interval)
  SOP_5_final=matrix(NA, ncol=3,nrow=analysis_interval)
  SOP_6_final=matrix(NA, ncol=3,nrow=analysis_interval)
  SOP_7_final=matrix(NA, ncol=3,nrow=analysis_interval)
  SOP_8_final=matrix(NA, ncol=3,nrow=analysis_interval)
  SOP_9_final=matrix(NA, ncol=3,nrow=analysis_interval)
  
  
  
  
  for (h in 1:analysis_interval) {
    
    TR_11_final[h,]=quantile(TR_var_11[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_12_final[h,]=quantile(TR_var_12[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_13_final[h,]=quantile(TR_var_13[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_14_final[h,]=quantile(TR_var_14[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_15_final[h,]=quantile(TR_var_15[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_16_final[h,]=quantile(TR_var_16[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_17_final[h,]=quantile(TR_var_17[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_18_final[h,]=quantile(TR_var_18[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_19_final[h,]=quantile(TR_var_19[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TR_22_final[h,]=quantile(TR_var_22[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_23_final[h,]=quantile(TR_var_23[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_24_final[h,]=quantile(TR_var_24[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_25_final[h,]=quantile(TR_var_25[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_26_final[h,]=quantile(TR_var_26[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_27_final[h,]=quantile(TR_var_27[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_28_final[h,]=quantile(TR_var_28[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_29_final[h,]=quantile(TR_var_29[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TR_33_final[h,]=quantile(TR_var_33[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_34_final[h,]=quantile(TR_var_34[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_35_final[h,]=quantile(TR_var_35[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_36_final[h,]=quantile(TR_var_36[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_37_final[h,]=quantile(TR_var_37[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_38_final[h,]=quantile(TR_var_38[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_39_final[h,]=quantile(TR_var_39[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TR_44_final[h,]=quantile(TR_var_44[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_45_final[h,]=quantile(TR_var_45[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_46_final[h,]=quantile(TR_var_46[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_47_final[h,]=quantile(TR_var_47[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_48_final[h,]=quantile(TR_var_48[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_49_final[h,]=quantile(TR_var_49[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TR_55_final[h,]=quantile(TR_var_55[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_56_final[h,]=quantile(TR_var_56[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_57_final[h,]=quantile(TR_var_57[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_58_final[h,]=quantile(TR_var_58[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_59_final[h,]=quantile(TR_var_59[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TR_66_final[h,]=quantile(TR_var_66[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_67_final[h,]=quantile(TR_var_67[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_68_final[h,]=quantile(TR_var_68[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_69_final[h,]=quantile(TR_var_69[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TR_77_final[h,]=quantile(TR_var_77[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_78_final[h,]=quantile(TR_var_78[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_79_final[h,]=quantile(TR_var_79[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TR_88_final[h,]=quantile(TR_var_88[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TR_89_final[h,]=quantile(TR_var_89[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TR_99_final[h,]=quantile(TR_var_99[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    
    
    TP_11_final[h,]=quantile(TP_var_11[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_12_final[h,]=quantile(TP_var_12[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_13_final[h,]=quantile(TP_var_13[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_14_final[h,]=quantile(TP_var_14[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_15_final[h,]=quantile(TP_var_15[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_16_final[h,]=quantile(TP_var_16[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_17_final[h,]=quantile(TP_var_17[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_18_final[h,]=quantile(TP_var_18[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_19_final[h,]=quantile(TP_var_19[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TP_22_final[h,]=quantile(TP_var_22[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_23_final[h,]=quantile(TP_var_23[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_24_final[h,]=quantile(TP_var_24[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_25_final[h,]=quantile(TP_var_25[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_26_final[h,]=quantile(TP_var_26[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_27_final[h,]=quantile(TP_var_27[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_28_final[h,]=quantile(TP_var_28[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_29_final[h,]=quantile(TP_var_29[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TP_33_final[h,]=quantile(TP_var_33[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_34_final[h,]=quantile(TP_var_34[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_35_final[h,]=quantile(TP_var_35[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_36_final[h,]=quantile(TP_var_36[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_37_final[h,]=quantile(TP_var_37[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_38_final[h,]=quantile(TP_var_38[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_39_final[h,]=quantile(TP_var_39[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TP_44_final[h,]=quantile(TP_var_44[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_45_final[h,]=quantile(TP_var_45[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_46_final[h,]=quantile(TP_var_46[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_47_final[h,]=quantile(TP_var_47[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_48_final[h,]=quantile(TP_var_48[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_49_final[h,]=quantile(TP_var_49[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TP_55_final[h,]=quantile(TP_var_55[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_56_final[h,]=quantile(TP_var_56[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_57_final[h,]=quantile(TP_var_57[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_58_final[h,]=quantile(TP_var_58[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_59_final[h,]=quantile(TP_var_59[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TP_66_final[h,]=quantile(TP_var_66[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_67_final[h,]=quantile(TP_var_67[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_68_final[h,]=quantile(TP_var_68[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_69_final[h,]=quantile(TP_var_69[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TP_77_final[h,]=quantile(TP_var_77[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_78_final[h,]=quantile(TP_var_78[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_79_final[h,]=quantile(TP_var_79[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TP_88_final[h,]=quantile(TP_var_88[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    TP_89_final[h,]=quantile(TP_var_89[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    TP_99_final[h,]=quantile(TP_var_99[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
    
    
    SOP_1_final[h,]=quantile(SOP_var_1[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    SOP_2_final[h,]=quantile(SOP_var_2[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    SOP_3_final[h,]=quantile(SOP_var_3[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    SOP_4_final[h,]=quantile(SOP_var_4[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    SOP_5_final[h,]=quantile(SOP_var_5[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    SOP_6_final[h,]=quantile(SOP_var_6[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    SOP_7_final[h,]=quantile(SOP_var_7[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    SOP_8_final[h,]=quantile(SOP_var_8[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    SOP_9_final[h,]=quantile(SOP_var_9[,h], probs = c(0.025, 0.5, 0.975), na.rm=T)
    
  }
  
  
  
  ###organize the TR results into tables
  
  t1=analysis_interval*1/5
  t2=analysis_interval*2/5
  t3=analysis_interval*3/5
  t4=analysis_interval*4/5
  t5=analysis_interval*5/5
  
  
  TR_t1_table=data.frame(rbind(
    TR_12_final[t1,], 
    TR_13_final[t1,], 
    TR_15_final[t1,], 
    TR_19_final[t1,], 
    
    TR_24_final[t1,], 
    TR_26_final[t1,], 
    TR_29_final[t1,],  
    
    TR_37_final[t1,], 
    TR_39_final[t1,],  
    
    TR_48_final[t1,], 
    TR_49_final[t1,],  
    
    TR_59_final[t1,],  
    TR_69_final[t1,],  
    TR_79_final[t1,],  
    TR_89_final[t1,] 
    
  )
  )
  
  colnames(TR_t1_table)=c("ll","mean","ul")
  rownames(TR_t1_table)=cbind("TR12","TR13","TR14","TR15","TR23","TR24","TR25", 
                              "TR34_0","TR35_0","TR34_1","TR35_1","TR45_0", "TR45_1", "TR45_2", "TR45_12")
  
  
  
  TR_t2_table=data.frame(rbind(
    TR_12_final[t2,], 
    TR_13_final[t2,], 
    TR_15_final[t2,], 
    TR_19_final[t2,], 
    
    TR_24_final[t2,], 
    TR_26_final[t2,], 
    TR_29_final[t2,],  
    
    TR_37_final[t2,], 
    TR_39_final[t2,],  
    
    TR_48_final[t2,], 
    TR_49_final[t2,],  
    
    TR_59_final[t2,],  
    TR_69_final[t2,],  
    TR_79_final[t2,],  
    TR_89_final[t2,] 
    
  )
  )
  
  
  colnames(TR_t2_table)=c("ll","mean","ul")
  rownames(TR_t2_table)=cbind("TR12","TR13","TR14","TR15","TR23","TR24","TR25", 
                              "TR34_0","TR35_0","TR34_1","TR35_1","TR45_0", "TR45_1", "TR45_2", "TR45_12")
  
  
  TR_t3_table=data.frame(rbind(
    TR_12_final[t3,], 
    TR_13_final[t3,], 
    TR_15_final[t3,], 
    TR_19_final[t3,], 
    
    TR_24_final[t3,], 
    TR_26_final[t3,], 
    TR_29_final[t3,],  
    
    TR_37_final[t3,], 
    TR_39_final[t3,],  
    
    TR_48_final[t3,], 
    TR_49_final[t3,],  
    
    TR_59_final[t3,],  
    TR_69_final[t3,],  
    TR_79_final[t3,],  
    TR_89_final[t3,] 
    
  )
  )
  
  colnames(TR_t3_table)=c("ll","mean","ul")
  rownames(TR_t3_table)=cbind("TR12","TR13","TR14","TR15","TR23","TR24","TR25", 
                              "TR34_0","TR35_0","TR34_1","TR35_1","TR45_0", "TR45_1", "TR45_2", "TR45_12")
  
  
  TR_t4_table=data.frame(rbind(
    TR_12_final[t4,], 
    TR_13_final[t4,], 
    TR_15_final[t4,], 
    TR_19_final[t4,], 
    
    TR_24_final[t4,], 
    TR_26_final[t4,], 
    TR_29_final[t4,],  
    
    TR_37_final[t4,], 
    TR_39_final[t4,],  
    
    TR_48_final[t4,], 
    TR_49_final[t4,],  
    
    TR_59_final[t4,],  
    TR_69_final[t4,],  
    TR_79_final[t4,],  
    TR_89_final[t4,] 
    
  )
  )
  
  
  colnames(TR_t4_table)=c("ll","mean","ul")
  rownames(TR_t4_table)=cbind("TR12","TR13","TR14","TR15","TR23","TR24","TR25", 
                              "TR34_0","TR35_0","TR34_1","TR35_1","TR45_0", "TR45_1", "TR45_2", "TR45_12")
  
  
  
  TR_t5_table=data.frame(rbind(
    TR_12_final[t5,], 
    TR_13_final[t5,], 
    TR_15_final[t5,], 
    TR_19_final[t5,], 
    
    TR_24_final[t5,], 
    TR_26_final[t5,], 
    TR_29_final[t5,],  
    
    TR_37_final[t5,], 
    TR_39_final[t5,],  
    
    TR_48_final[t5,], 
    TR_49_final[t5,],  
    
    TR_59_final[t5,],  
    TR_69_final[t5,],  
    TR_79_final[t5,],  
    TR_89_final[t5,] 
    
  )
  )
  
  
  colnames(TR_t5_table)=c("ll","mean","ul")
  rownames(TR_t5_table)=cbind("TR12","TR13","TR14","TR15","TR23","TR24","TR25", 
                              "TR34_0","TR35_0","TR34_1","TR35_1","TR45_0", "TR45_1", "TR45_2", "TR45_12")
  
  
##convert rate to hazard
  
  TR_t1_table=(TR_t1_table)*(1/break_interval)*100
  TR_t2_table=(TR_t2_table)*(1/break_interval)*100
  TR_t3_table=(TR_t3_table)*(1/break_interval)*100
  TR_t4_table=(TR_t4_table)*(1/break_interval)*100
  TR_t5_table=(TR_t5_table)*(1/break_interval)*100

  
  write.table(TR_t1_table, file.path("./R2.boot.model/", paste0("TR_t1_",ps,".txt")))
  write.table(TR_t2_table, file.path("./R2.boot.model/", paste0("TR_t2_",ps,".txt")))
  write.table(TR_t3_table, file.path("./R2.boot.model/", paste0("TR_t3_",ps,".txt")))
  write.table(TR_t4_table, file.path("./R2.boot.model/", paste0("TR_t4_",ps,".txt")))
  write.table(TR_t5_table, file.path("./R2.boot.model/", paste0("TR_t5_",ps,".txt")))
  
  
 
  ###organize the TP results into tables
  
  
  TP_t1_table=data.frame(rbind(
    TP_12_final[t1,], 
    TP_13_final[t1,], 
    TP_15_final[t1,], 
    TP_19_final[t1,], 
    
    TP_24_final[t1,], 
    TP_26_final[t1,], 
    TP_29_final[t1,],  
    
    TP_37_final[t1,], 
    TP_39_final[t1,],  
    
    TP_48_final[t1,], 
    TP_49_final[t1,],  
    
    TP_59_final[t1,],  
    TP_69_final[t1,],  
    TP_79_final[t1,],  
    TP_89_final[t1,] 
    
  )
  )
  
  colnames(TP_t1_table)=c("ll","mean","ul")
  rownames(TP_t1_table)=cbind("TP12","TP13","TP14","TP15","TP23","TP24","TP25", 
                              "TP34_0","TP35_0","TP34_1","TP35_1","TP45_0", "TP45_1", "TP45_2", "TP45_12")
  
  
  
  TP_t2_table=data.frame(rbind(
    TP_12_final[t2,], 
    TP_13_final[t2,], 
    TP_15_final[t2,], 
    TP_19_final[t2,], 
    
    TP_24_final[t2,], 
    TP_26_final[t2,], 
    TP_29_final[t2,],  
    
    TP_37_final[t2,], 
    TP_39_final[t2,],  
    
    TP_48_final[t2,], 
    TP_49_final[t2,],  
    
    TP_59_final[t2,],  
    TP_69_final[t2,],  
    TP_79_final[t2,],  
    TP_89_final[t2,] 
    
  )
  )
  
  
  colnames(TP_t2_table)=c("ll","mean","ul")
  rownames(TP_t2_table)=cbind("TP12","TP13","TP14","TP15","TP23","TP24","TP25", 
                              "TP34_0","TP35_0","TP34_1","TP35_1","TP45_0", "TP45_1", "TP45_2", "TP45_12")
  
  
  TP_t3_table=data.frame(rbind(
    TP_12_final[t3,], 
    TP_13_final[t3,], 
    TP_15_final[t3,], 
    TP_19_final[t3,], 
    
    TP_24_final[t3,], 
    TP_26_final[t3,], 
    TP_29_final[t3,],  
    
    TP_37_final[t3,], 
    TP_39_final[t3,],  
    
    TP_48_final[t3,], 
    TP_49_final[t3,],  
    
    TP_59_final[t3,],  
    TP_69_final[t3,],  
    TP_79_final[t3,],  
    TP_89_final[t3,] 
    
  )
  )
  
  colnames(TP_t3_table)=c("ll","mean","ul")
  rownames(TP_t3_table)=cbind("TP12","TP13","TP14","TP15","TP23","TP24","TP25", 
                              "TP34_0","TP35_0","TP34_1","TP35_1","TP45_0", "TP45_1", "TP45_2", "TP45_12")
  
  
  TP_t4_table=data.frame(rbind(
    TP_12_final[t4,], 
    TP_13_final[t4,], 
    TP_15_final[t4,], 
    TP_19_final[t4,], 
    
    TP_24_final[t4,], 
    TP_26_final[t4,], 
    TP_29_final[t4,],  
    
    TP_37_final[t4,], 
    TP_39_final[t4,],  
    
    TP_48_final[t4,], 
    TP_49_final[t4,],  
    
    TP_59_final[t4,],  
    TP_69_final[t4,],  
    TP_79_final[t4,],  
    TP_89_final[t4,] 
    
  )
  )
  
  
  colnames(TP_t4_table)=c("ll","mean","ul")
  rownames(TP_t4_table)=cbind("TP12","TP13","TP14","TP15","TP23","TP24","TP25", 
                              "TP34_0","TP35_0","TP34_1","TP35_1","TP45_0", "TP45_1", "TP45_2", "TP45_12")
  
  
  
  TP_t5_table=data.frame(rbind(
    TP_12_final[t5,], 
    TP_13_final[t5,], 
    TP_15_final[t5,], 
    TP_19_final[t5,], 
    
    TP_24_final[t5,], 
    TP_26_final[t5,], 
    TP_29_final[t5,],  
    
    TP_37_final[t5,], 
    TP_39_final[t5,],  
    
    TP_48_final[t5,], 
    TP_49_final[t5,],  
    
    TP_59_final[t5,],  
    TP_69_final[t5,],  
    TP_79_final[t5,],  
    TP_89_final[t5,] 
    
  )
  )
  
  
  colnames(TP_t5_table)=c("ll","mean","ul")
  rownames(TP_t5_table)=cbind("TP12","TP13","TP14","TP15","TP23","TP24","TP25", 
                              "TP34_0","TP35_0","TP34_1","TP35_1","TP45_0", "TP45_1", "TP45_2", "TP45_12")
  
  
  ##convert rate to hazard
  
  TP_t1_table=(TP_t1_table)*100
  TP_t2_table=(TP_t2_table)*100
  TP_t3_table=(TP_t3_table)*100
  TP_t4_table=(TP_t4_table)*100
  TP_t5_table=(TP_t5_table)*100
  
  
  write.table(TP_t1_table, file.path("./R2.boot.model/", paste0("TP_t1_",ps,".txt")))
  write.table(TP_t2_table, file.path("./R2.boot.model/", paste0("TP_t2_",ps,".txt")))
  write.table(TP_t3_table, file.path("./R2.boot.model/", paste0("TP_t3_",ps,".txt")))
  write.table(TP_t4_table, file.path("./R2.boot.model/", paste0("TP_t4_",ps,".txt")))
  write.table(TP_t5_table, file.path("./R2.boot.model/", paste0("TP_t5_",ps,".txt")))
  
}

end <- Sys.time()

end-start



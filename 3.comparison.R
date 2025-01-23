#install.packages("matrixStats")
library(matrixStats)

  library(dplyr)

setwd("/multi_state")

#source("./Theortical_data1.R")
tr_matrix=read.table("true_markov_exp.txt")
setwd("./0.5k.markov.data")

#source("./Theortical_data2.R")
#tr_matrix=true_non_markov_exp
#setwd("./5.constant.nonmarkov.data")

#source("./Theortical_data3.R")
#tr_matrix=true_markov_weilbull
#setwd("./5.nonconstant.markov.data")

#source("./Theortical_data4.R")
#tr_matrix=true_non_markov_weilbull
#setwd("./5.nonconstant.nonmarkov.data")


con.mar_t1 = stringr::str_sort(list.files(pattern="TR_t1_.*txt", path="./R2.data/R2.boot.model/", full.names=TRUE), num = TRUE)
con.mar_t2 = stringr::str_sort(list.files(pattern="TR_t2_.*txt", path="./R2.data/R2.boot.model/", full.names=TRUE), num = TRUE)
con.mar_t3 = stringr::str_sort(list.files(pattern="TR_t3_.*txt", path="./R2.data/R2.boot.model/", full.names=TRUE), num = TRUE)
con.mar_t4 = stringr::str_sort(list.files(pattern="TR_t4_.*txt", path="./R2.data/R2.boot.model/", full.names=TRUE), num = TRUE)
con.mar_t5 = stringr::str_sort(list.files(pattern="TR_t5_.*txt", path="./R2.data/R2.boot.model/", full.names=TRUE), num = TRUE)



con.mar_nonmar_t1 = stringr::str_sort(list.files(pattern="TR_t1_.*txt", path="/nas/longleaf/home/mingding/paper1.simu/5k.markov.data/non.markov.model/", full.names=TRUE), num = TRUE)
con.mar_nonmar_t2 = stringr::str_sort(list.files(pattern="TR_t2_.*txt", path="/nas/longleaf/home/mingding/paper1.simu/5k.markov.data/non.markov.model/", full.names=TRUE), num = TRUE)
con.mar_nonmar_t3 = stringr::str_sort(list.files(pattern="TR_t3_.*txt", path="/nas/longleaf/home/mingding/paper1.simu/5k.markov.data/non.markov.model/", full.names=TRUE), num = TRUE)
con.mar_nonmar_t4 = stringr::str_sort(list.files(pattern="TR_t4_.*txt", path="/nas/longleaf/home/mingding/paper1.simu/5k.markov.data/non.markov.model/", full.names=TRUE), num = TRUE)
con.mar_nonmar_t5 = stringr::str_sort(list.files(pattern="TR_t5_.*txt", path="/nas/longleaf/home/mingding/paper1.simu/5k.markov.data/non.markov.model/", full.names=TRUE), num = TRUE)


ps_start=1

ps_end=500

for (ps in ps_start:ps_end){
  
  if (ps==ps_start) {
    
    tr_t1=tr_matrix[1,1:15]*100
    tr_t2=tr_matrix[2,1:15]*100
    tr_t3=tr_matrix[3,1:15]*100
    tr_t4=tr_matrix[4,1:15]*100
    tr_t5=tr_matrix[5,1:15]*100
    
    con.mar_t1_12<-rbind((read.table(con.mar_t1[ps]))["TR12",])
    con.mar_t1_13<-rbind((read.table(con.mar_t1[ps]))["TR13",])
    con.mar_t1_14<-rbind((read.table(con.mar_t1[ps]))["TR14",])
    con.mar_t1_15<-rbind((read.table(con.mar_t1[ps]))["TR15",])
    con.mar_t1_23<-rbind((read.table(con.mar_t1[ps]))["TR23",])
    con.mar_t1_24<-rbind((read.table(con.mar_t1[ps]))["TR24",])
    con.mar_t1_25<-rbind((read.table(con.mar_t1[ps]))["TR25",])
    con.mar_t1_34_0<-rbind((read.table(con.mar_t1[ps]))["TR34_0",])
    con.mar_t1_35_0<-rbind((read.table(con.mar_t1[ps]))["TR35_0",])
    con.mar_t1_34_1<-rbind((read.table(con.mar_t1[ps]))["TR34_1",])
    con.mar_t1_35_1<-rbind((read.table(con.mar_t1[ps]))["TR35_1",])
    con.mar_t1_45_0<-rbind((read.table(con.mar_t1[ps]))["TR45_0",])
    con.mar_t1_45_1<-rbind((read.table(con.mar_t1[ps]))["TR45_1",])
    con.mar_t1_45_2<-rbind((read.table(con.mar_t1[ps]))["TR45_2",])
    con.mar_t1_45_12<-rbind((read.table(con.mar_t1[ps]))["TR45_12",])
    
    
    con.mar_t2_12<-rbind((read.table(con.mar_t2[ps]))["TR12",])
    con.mar_t2_13<-rbind((read.table(con.mar_t2[ps]))["TR13",])
    con.mar_t2_14<-rbind((read.table(con.mar_t2[ps]))["TR14",])
    con.mar_t2_15<-rbind((read.table(con.mar_t2[ps]))["TR15",])
    con.mar_t2_23<-rbind((read.table(con.mar_t2[ps]))["TR23",])
    con.mar_t2_24<-rbind((read.table(con.mar_t2[ps]))["TR24",])
    con.mar_t2_25<-rbind((read.table(con.mar_t2[ps]))["TR25",])
    con.mar_t2_34_0<-rbind((read.table(con.mar_t2[ps]))["TR34_0",])
    con.mar_t2_35_0<-rbind((read.table(con.mar_t2[ps]))["TR35_0",])
    con.mar_t2_34_1<-rbind((read.table(con.mar_t2[ps]))["TR34_1",])
    con.mar_t2_35_1<-rbind((read.table(con.mar_t2[ps]))["TR35_1",])
    con.mar_t2_45_0<-rbind((read.table(con.mar_t2[ps]))["TR45_0",])
    con.mar_t2_45_1<-rbind((read.table(con.mar_t2[ps]))["TR45_1",])
    con.mar_t2_45_2<-rbind((read.table(con.mar_t2[ps]))["TR45_2",])
    con.mar_t2_45_12<-rbind((read.table(con.mar_t2[ps]))["TR45_12",])

    
    con.mar_t3_12<-rbind((read.table(con.mar_t3[ps]))["TR12",])
    con.mar_t3_13<-rbind((read.table(con.mar_t3[ps]))["TR13",])
    con.mar_t3_14<-rbind((read.table(con.mar_t3[ps]))["TR14",])
    con.mar_t3_15<-rbind((read.table(con.mar_t3[ps]))["TR15",])
    con.mar_t3_23<-rbind((read.table(con.mar_t3[ps]))["TR23",])
    con.mar_t3_24<-rbind((read.table(con.mar_t3[ps]))["TR24",])
    con.mar_t3_25<-rbind((read.table(con.mar_t3[ps]))["TR25",])
    con.mar_t3_34_0<-rbind((read.table(con.mar_t3[ps]))["TR34_0",])
    con.mar_t3_35_0<-rbind((read.table(con.mar_t3[ps]))["TR35_0",])
    con.mar_t3_34_1<-rbind((read.table(con.mar_t3[ps]))["TR34_1",])
    con.mar_t3_35_1<-rbind((read.table(con.mar_t3[ps]))["TR35_1",])
    con.mar_t3_45_0<-rbind((read.table(con.mar_t3[ps]))["TR45_0",])
    con.mar_t3_45_1<-rbind((read.table(con.mar_t3[ps]))["TR45_1",])
    con.mar_t3_45_2<-rbind((read.table(con.mar_t3[ps]))["TR45_2",])
    con.mar_t3_45_12<-rbind((read.table(con.mar_t3[ps]))["TR45_12",])
    

    con.mar_t4_12<-rbind((read.table(con.mar_t4[ps]))["TR12",])
    con.mar_t4_13<-rbind((read.table(con.mar_t4[ps]))["TR13",])
    con.mar_t4_14<-rbind((read.table(con.mar_t4[ps]))["TR14",])
    con.mar_t4_15<-rbind((read.table(con.mar_t4[ps]))["TR15",])
    con.mar_t4_23<-rbind((read.table(con.mar_t4[ps]))["TR23",])
    con.mar_t4_24<-rbind((read.table(con.mar_t4[ps]))["TR24",])
    con.mar_t4_25<-rbind((read.table(con.mar_t4[ps]))["TR25",])
    con.mar_t4_34_0<-rbind((read.table(con.mar_t4[ps]))["TR34_0",])
    con.mar_t4_35_0<-rbind((read.table(con.mar_t4[ps]))["TR35_0",])
    con.mar_t4_34_1<-rbind((read.table(con.mar_t4[ps]))["TR34_1",])
    con.mar_t4_35_1<-rbind((read.table(con.mar_t4[ps]))["TR35_1",])
    con.mar_t4_45_0<-rbind((read.table(con.mar_t4[ps]))["TR45_0",])
    con.mar_t4_45_1<-rbind((read.table(con.mar_t4[ps]))["TR45_1",])
    con.mar_t4_45_2<-rbind((read.table(con.mar_t4[ps]))["TR45_2",])
    con.mar_t4_45_12<-rbind((read.table(con.mar_t4[ps]))["TR45_12",])

    
    con.mar_t5_12<-rbind((read.table(con.mar_t5[ps]))["TR12",])
    con.mar_t5_13<-rbind((read.table(con.mar_t5[ps]))["TR13",])
    con.mar_t5_14<-rbind((read.table(con.mar_t5[ps]))["TR14",])
    con.mar_t5_15<-rbind((read.table(con.mar_t5[ps]))["TR15",])
    con.mar_t5_23<-rbind((read.table(con.mar_t5[ps]))["TR23",])
    con.mar_t5_24<-rbind((read.table(con.mar_t5[ps]))["TR24",])
    con.mar_t5_25<-rbind((read.table(con.mar_t5[ps]))["TR25",])
    con.mar_t5_34_0<-rbind((read.table(con.mar_t5[ps]))["TR34_0",])
    con.mar_t5_35_0<-rbind((read.table(con.mar_t5[ps]))["TR35_0",])
    con.mar_t5_34_1<-rbind((read.table(con.mar_t5[ps]))["TR34_1",])
    con.mar_t5_35_1<-rbind((read.table(con.mar_t5[ps]))["TR35_1",])
    con.mar_t5_45_0<-rbind((read.table(con.mar_t5[ps]))["TR45_0",])
    con.mar_t5_45_1<-rbind((read.table(con.mar_t5[ps]))["TR45_1",])
    con.mar_t5_45_2<-rbind((read.table(con.mar_t5[ps]))["TR45_2",])
    con.mar_t5_45_12<-rbind((read.table(con.mar_t5[ps]))["TR45_12",])
    
    
    
    con.mar_nonmar_t1_12<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR12",])
    con.mar_nonmar_t1_13<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR13",])
    con.mar_nonmar_t1_14<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR14",])
    con.mar_nonmar_t1_15<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR15",])
    con.mar_nonmar_t1_23<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR23",])
    con.mar_nonmar_t1_24<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR24",])
    con.mar_nonmar_t1_25<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR25",])
    con.mar_nonmar_t1_34_0<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR34_0",])
    con.mar_nonmar_t1_35_0<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR35_0",])
    con.mar_nonmar_t1_34_1<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR34_1",])
    con.mar_nonmar_t1_35_1<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR35_1",])
    con.mar_nonmar_t1_45_0<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR45_0",])
    con.mar_nonmar_t1_45_1<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR45_1",])
    con.mar_nonmar_t1_45_2<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR45_2",])
    con.mar_nonmar_t1_45_12<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR45_12",])
    
    
    con.mar_nonmar_t2_12<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR12",])
    con.mar_nonmar_t2_13<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR13",])
    con.mar_nonmar_t2_14<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR14",])
    con.mar_nonmar_t2_15<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR15",])
    con.mar_nonmar_t2_23<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR23",])
    con.mar_nonmar_t2_24<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR24",])
    con.mar_nonmar_t2_25<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR25",])
    con.mar_nonmar_t2_34_0<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR34_0",])
    con.mar_nonmar_t2_35_0<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR35_0",])
    con.mar_nonmar_t2_34_1<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR34_1",])
    con.mar_nonmar_t2_35_1<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR35_1",])
    con.mar_nonmar_t2_45_0<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR45_0",])
    con.mar_nonmar_t2_45_1<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR45_1",])
    con.mar_nonmar_t2_45_2<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR45_2",])
    con.mar_nonmar_t2_45_12<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR45_12",])
    

    con.mar_nonmar_t3_12<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR12",])
    con.mar_nonmar_t3_13<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR13",])
    con.mar_nonmar_t3_14<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR14",])
    con.mar_nonmar_t3_15<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR15",])
    con.mar_nonmar_t3_23<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR23",])
    con.mar_nonmar_t3_24<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR24",])
    con.mar_nonmar_t3_25<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR25",])
    con.mar_nonmar_t3_34_0<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR34_0",])
    con.mar_nonmar_t3_35_0<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR35_0",])
    con.mar_nonmar_t3_34_1<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR34_1",])
    con.mar_nonmar_t3_35_1<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR35_1",])
    con.mar_nonmar_t3_45_0<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR45_0",])
    con.mar_nonmar_t3_45_1<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR45_1",])
    con.mar_nonmar_t3_45_2<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR45_2",])
    con.mar_nonmar_t3_45_12<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR45_12",])
    

    
    con.mar_nonmar_t4_12<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR12",])
    con.mar_nonmar_t4_13<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR13",])
    con.mar_nonmar_t4_14<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR14",])
    con.mar_nonmar_t4_15<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR15",])
    con.mar_nonmar_t4_23<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR23",])
    con.mar_nonmar_t4_24<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR24",])
    con.mar_nonmar_t4_25<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR25",])
    con.mar_nonmar_t4_34_0<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR34_0",])
    con.mar_nonmar_t4_35_0<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR35_0",])
    con.mar_nonmar_t4_34_1<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR34_1",])
    con.mar_nonmar_t4_35_1<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR35_1",])
    con.mar_nonmar_t4_45_0<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR45_0",])
    con.mar_nonmar_t4_45_1<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR45_1",])
    con.mar_nonmar_t4_45_2<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR45_2",])
    con.mar_nonmar_t4_45_12<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR45_12",])
    
    con.mar_nonmar_t5_12<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR12",])
    con.mar_nonmar_t5_13<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR13",])
    con.mar_nonmar_t5_14<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR14",])
    con.mar_nonmar_t5_15<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR15",])
    con.mar_nonmar_t5_23<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR23",])
    con.mar_nonmar_t5_24<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR24",])
    con.mar_nonmar_t5_25<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR25",])
    con.mar_nonmar_t5_34_0<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR34_0",])
    con.mar_nonmar_t5_35_0<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR35_0",])
    con.mar_nonmar_t5_34_1<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR34_1",])
    con.mar_nonmar_t5_35_1<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR35_1",])
    con.mar_nonmar_t5_45_0<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR45_0",])
    con.mar_nonmar_t5_45_1<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR45_1",])
    con.mar_nonmar_t5_45_2<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR45_2",])
    con.mar_nonmar_t5_45_12<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR45_12",])
    
    
  } else if (ps>ps_start) {
    
    
    temp_tr_t1=tr_matrix[1,1:15]*100
    temp_tr_t2=tr_matrix[2,1:15]*100
    temp_tr_t3=tr_matrix[3,1:15]*100
    temp_tr_t4=tr_matrix[4,1:15]*100
    temp_tr_t5=tr_matrix[5,1:15]*100
    
    
    tr_t1<-rbind(tr_t1, temp_tr_t1)
    tr_t2<-rbind(tr_t2, temp_tr_t2)
    tr_t3<-rbind(tr_t3, temp_tr_t3)
    tr_t4<-rbind(tr_t4, temp_tr_t4)
    tr_t5<-rbind(tr_t5, temp_tr_t5)
    
    rm(temp_tr_t1)
    rm(temp_tr_t2)
    rm(temp_tr_t3)
    rm(temp_tr_t4)
    rm(temp_tr_t5)
    
    temp_t1_12<-rbind((read.table(con.mar_t1[ps]))["TR12",])
    con.mar_t1_12<-rbind(con.mar_t1_12, temp_t1_12)
    rm(temp_t1_12)
    
    temp_t2_12<-rbind((read.table(con.mar_t2[ps]))["TR12",])
    con.mar_t2_12<-rbind(con.mar_t2_12, temp_t2_12)
    rm(temp_t2_12)
    
    temp_t3_12<-rbind((read.table(con.mar_t3[ps]))["TR12",])
    con.mar_t3_12<-rbind(con.mar_t3_12, temp_t3_12)
    rm(temp_t3_12)
    
    temp_t4_12<-rbind((read.table(con.mar_t4[ps]))["TR12",])
    con.mar_t4_12<-rbind(con.mar_t4_12, temp_t4_12)
    rm(temp_t4_12)
    
    temp_t5_12<-rbind((read.table(con.mar_t5[ps]))["TR12",])
    con.mar_t5_12<-rbind(con.mar_t5_12, temp_t5_12)
    rm(temp_t5_12)
    
    
    
    
    temp_t1_13<-rbind((read.table(con.mar_t1[ps]))["TR13",])
    con.mar_t1_13<-rbind(con.mar_t1_13, temp_t1_13)
    rm(temp_t1_13)
    
    temp_t2_13<-rbind((read.table(con.mar_t2[ps]))["TR13",])
    con.mar_t2_13<-rbind(con.mar_t2_13, temp_t2_13)
    rm(temp_t2_13)
    
    temp_t3_13<-rbind((read.table(con.mar_t3[ps]))["TR13",])
    con.mar_t3_13<-rbind(con.mar_t3_13, temp_t3_13)
    rm(temp_t3_13)
    
    temp_t4_13<-rbind((read.table(con.mar_t4[ps]))["TR13",])
    con.mar_t4_13<-rbind(con.mar_t4_13, temp_t4_13)
    rm(temp_t4_13)
    
    temp_t5_13<-rbind((read.table(con.mar_t5[ps]))["TR13",])
    con.mar_t5_13<-rbind(con.mar_t5_13, temp_t5_13)
    rm(temp_t5_13)
    
    
    
    temp_t1_14<-rbind((read.table(con.mar_t1[ps]))["TR14",])
    con.mar_t1_14<-rbind(con.mar_t1_14, temp_t1_14)
    rm(temp_t1_14)
    
    temp_t2_14<-rbind((read.table(con.mar_t2[ps]))["TR14",])
    con.mar_t2_14<-rbind(con.mar_t2_14, temp_t2_14)
    rm(temp_t2_14)
    
    temp_t3_14<-rbind((read.table(con.mar_t3[ps]))["TR14",])
    con.mar_t3_14<-rbind(con.mar_t3_14, temp_t3_14)
    rm(temp_t3_14)
    
    temp_t4_14<-rbind((read.table(con.mar_t4[ps]))["TR14",])
    con.mar_t4_14<-rbind(con.mar_t4_14, temp_t4_14)
    rm(temp_t4_14)
    
    temp_t5_14<-rbind((read.table(con.mar_t5[ps]))["TR14",])
    con.mar_t5_14<-rbind(con.mar_t5_14, temp_t5_14)
    rm(temp_t5_14)
    
    
    
    temp_t1_15<-rbind((read.table(con.mar_t1[ps]))["TR15",])
    con.mar_t1_15<-rbind(con.mar_t1_15, temp_t1_15)
    rm(temp_t1_15)
    
    temp_t2_15<-rbind((read.table(con.mar_t2[ps]))["TR15",])
    con.mar_t2_15<-rbind(con.mar_t2_15, temp_t2_15)
    rm(temp_t2_15)
    
    temp_t3_15<-rbind((read.table(con.mar_t3[ps]))["TR15",])
    con.mar_t3_15<-rbind(con.mar_t3_15, temp_t3_15)
    rm(temp_t3_15)
    
    temp_t4_15<-rbind((read.table(con.mar_t4[ps]))["TR15",])
    con.mar_t4_15<-rbind(con.mar_t4_15, temp_t4_15)
    rm(temp_t4_15)
    
    temp_t5_15<-rbind((read.table(con.mar_t5[ps]))["TR15",])
    con.mar_t5_15<-rbind(con.mar_t5_15, temp_t5_15)
    rm(temp_t5_15)
    
    
    temp_t1_23<-rbind((read.table(con.mar_t1[ps]))["TR23",])
    con.mar_t1_23<-rbind(con.mar_t1_23, temp_t1_23)
    rm(temp_t1_23)
    
    temp_t2_23<-rbind((read.table(con.mar_t2[ps]))["TR23",])
    con.mar_t2_23<-rbind(con.mar_t2_23, temp_t2_23)
    rm(temp_t2_23)
    
    temp_t3_23<-rbind((read.table(con.mar_t3[ps]))["TR23",])
    con.mar_t3_23<-rbind(con.mar_t3_23, temp_t3_23)
    rm(temp_t3_23)
    
    temp_t4_23<-rbind((read.table(con.mar_t4[ps]))["TR23",])
    con.mar_t4_23<-rbind(con.mar_t4_23, temp_t4_23)
    rm(temp_t4_23)
    
    temp_t5_23<-rbind((read.table(con.mar_t5[ps]))["TR23",])
    con.mar_t5_23<-rbind(con.mar_t5_23, temp_t5_23)
    rm(temp_t5_23)
    
    
    
    
    temp_t1_24<-rbind((read.table(con.mar_t1[ps]))["TR24",])
    con.mar_t1_24<-rbind(con.mar_t1_24, temp_t1_24)
    rm(temp_t1_24)
    
    temp_t2_24<-rbind((read.table(con.mar_t2[ps]))["TR24",])
    con.mar_t2_24<-rbind(con.mar_t2_24, temp_t2_24)
    rm(temp_t2_24)
    
    temp_t3_24<-rbind((read.table(con.mar_t3[ps]))["TR24",])
    con.mar_t3_24<-rbind(con.mar_t3_24, temp_t3_24)
    rm(temp_t3_24)
    
    temp_t4_24<-rbind((read.table(con.mar_t4[ps]))["TR24",])
    con.mar_t4_24<-rbind(con.mar_t4_24, temp_t4_24)
    rm(temp_t4_24)
    
    temp_t5_24<-rbind((read.table(con.mar_t5[ps]))["TR24",])
    con.mar_t5_24<-rbind(con.mar_t5_24, temp_t5_24)
    rm(temp_t5_24)
    
    
    
    
    temp_t1_25<-rbind((read.table(con.mar_t1[ps]))["TR25",])
    con.mar_t1_25<-rbind(con.mar_t1_25, temp_t1_25)
    rm(temp_t1_25)
    
    temp_t2_25<-rbind((read.table(con.mar_t2[ps]))["TR25",])
    con.mar_t2_25<-rbind(con.mar_t2_25, temp_t2_25)
    rm(temp_t2_25)
    
    temp_t3_25<-rbind((read.table(con.mar_t3[ps]))["TR25",])
    con.mar_t3_25<-rbind(con.mar_t3_25, temp_t3_25)
    rm(temp_t3_25)
    
    temp_t4_25<-rbind((read.table(con.mar_t4[ps]))["TR25",])
    con.mar_t4_25<-rbind(con.mar_t4_25, temp_t4_25)
    rm(temp_t4_25)
    
    temp_t5_25<-rbind((read.table(con.mar_t5[ps]))["TR25",])
    con.mar_t5_25<-rbind(con.mar_t5_25, temp_t5_25)
    rm(temp_t5_25)
    
    
    
    temp_t1_34_0<-rbind((read.table(con.mar_t1[ps]))["TR34_0",])
    con.mar_t1_34_0<-rbind(con.mar_t1_34_0, temp_t1_34_0)

    temp_t2_34_0<-rbind((read.table(con.mar_t2[ps]))["TR34_0",])
    con.mar_t2_34_0<-rbind(con.mar_t2_34_0, temp_t2_34_0)

    temp_t3_34_0<-rbind((read.table(con.mar_t3[ps]))["TR34_0",])
    con.mar_t3_34_0<-rbind(con.mar_t3_34_0, temp_t3_34_0)

    temp_t4_34_0<-rbind((read.table(con.mar_t4[ps]))["TR34_0",])
    con.mar_t4_34_0<-rbind(con.mar_t4_34_0, temp_t4_34_0)

    temp_t5_34_0<-rbind((read.table(con.mar_t5[ps]))["TR34_0",])
    con.mar_t5_34_0<-rbind(con.mar_t5_34_0, temp_t5_34_0)

    
    
    temp_t1_34_1<-rbind((read.table(con.mar_t1[ps]))["TR34_1",])
    con.mar_t1_34_1<-rbind(con.mar_t1_34_1, temp_t1_34_1)

    temp_t2_34_1<-rbind((read.table(con.mar_t2[ps]))["TR34_1",])
    con.mar_t2_34_1<-rbind(con.mar_t2_34_1, temp_t2_34_1)

    temp_t3_34_1<-rbind((read.table(con.mar_t3[ps]))["TR34_1",])
    con.mar_t3_34_1<-rbind(con.mar_t3_34_1, temp_t3_34_1)

    temp_t4_34_1<-rbind((read.table(con.mar_t4[ps]))["TR34_1",])
    con.mar_t4_34_1<-rbind(con.mar_t4_34_1, temp_t4_34_1)

    temp_t5_34_1<-rbind((read.table(con.mar_t5[ps]))["TR34_1",])
    con.mar_t5_34_1<-rbind(con.mar_t5_34_1, temp_t5_34_1)

    
    
    temp_t1_35_0<-rbind((read.table(con.mar_t1[ps]))["TR35_0",])
    con.mar_t1_35_0<-rbind(con.mar_t1_35_0, temp_t1_35_0)

    temp_t2_35_0<-rbind((read.table(con.mar_t2[ps]))["TR35_0",])
    con.mar_t2_35_0<-rbind(con.mar_t2_35_0, temp_t2_35_0)

    temp_t3_35_0<-rbind((read.table(con.mar_t3[ps]))["TR35_0",])
    con.mar_t3_35_0<-rbind(con.mar_t3_35_0, temp_t3_35_0)

    temp_t4_35_0<-rbind((read.table(con.mar_t4[ps]))["TR35_0",])
    con.mar_t4_35_0<-rbind(con.mar_t4_35_0, temp_t4_35_0)

    temp_t5_35_0<-rbind((read.table(con.mar_t5[ps]))["TR35_0",])
    con.mar_t5_35_0<-rbind(con.mar_t5_35_0, temp_t5_35_0)

    
    temp_t1_35_1<-rbind((read.table(con.mar_t1[ps]))["TR35_1",])
    con.mar_t1_35_1<-rbind(con.mar_t1_35_1, temp_t1_35_1)

    temp_t2_35_1<-rbind((read.table(con.mar_t2[ps]))["TR35_1",])
    con.mar_t2_35_1<-rbind(con.mar_t2_35_1, temp_t2_35_1)

    temp_t3_35_1<-rbind((read.table(con.mar_t3[ps]))["TR35_1",])
    con.mar_t3_35_1<-rbind(con.mar_t3_35_1, temp_t3_35_1)

    temp_t4_35_1<-rbind((read.table(con.mar_t4[ps]))["TR35_1",])
    con.mar_t4_35_1<-rbind(con.mar_t4_35_1, temp_t4_35_1)

    temp_t5_35_1<-rbind((read.table(con.mar_t5[ps]))["TR35_1",])
    con.mar_t5_35_1<-rbind(con.mar_t5_35_1, temp_t5_35_1)

    
    
    temp_t1_45_0<-rbind((read.table(con.mar_t1[ps]))["TR45_0",])
    con.mar_t1_45_0<-rbind(con.mar_t1_45_0, temp_t1_45_0)

    temp_t2_45_0<-rbind((read.table(con.mar_t2[ps]))["TR45_0",])
    con.mar_t2_45_0<-rbind(con.mar_t2_45_0, temp_t2_45_0)

    temp_t3_45_0<-rbind((read.table(con.mar_t3[ps]))["TR45_0",])
    con.mar_t3_45_0<-rbind(con.mar_t3_45_0, temp_t3_45_0)

    temp_t4_45_0<-rbind((read.table(con.mar_t4[ps]))["TR45_0",])
    con.mar_t4_45_0<-rbind(con.mar_t4_45_0, temp_t4_45_0)

    temp_t5_45_0<-rbind((read.table(con.mar_t5[ps]))["TR45_0",])
    con.mar_t5_45_0<-rbind(con.mar_t5_45_0, temp_t5_45_0)

    
    temp_t1_45_1<-rbind((read.table(con.mar_t1[ps]))["TR45_1",])
    con.mar_t1_45_1<-rbind(con.mar_t1_45_1, temp_t1_45_1)

    temp_t2_45_1<-rbind((read.table(con.mar_t2[ps]))["TR45_1",])
    con.mar_t2_45_1<-rbind(con.mar_t2_45_1, temp_t2_45_1)

    temp_t3_45_1<-rbind((read.table(con.mar_t3[ps]))["TR45_1",])
    con.mar_t3_45_1<-rbind(con.mar_t3_45_1, temp_t3_45_1)

    temp_t4_45_1<-rbind((read.table(con.mar_t4[ps]))["TR45_1",])
    con.mar_t4_45_1<-rbind(con.mar_t4_45_1, temp_t4_45_1)

    temp_t5_45_1<-rbind((read.table(con.mar_t5[ps]))["TR45_1",])
    con.mar_t5_45_1<-rbind(con.mar_t5_45_1, temp_t5_45_1)

    
    temp_t1_45_2<-rbind((read.table(con.mar_t1[ps]))["TR45_2",])
    con.mar_t1_45_2<-rbind(con.mar_t1_45_2, temp_t1_45_2)

    temp_t2_45_2<-rbind((read.table(con.mar_t2[ps]))["TR45_2",])
    con.mar_t2_45_2<-rbind(con.mar_t2_45_2, temp_t2_45_2)

    temp_t3_45_2<-rbind((read.table(con.mar_t3[ps]))["TR45_2",])
    con.mar_t3_45_2<-rbind(con.mar_t3_45_2, temp_t3_45_2)

    temp_t4_45_2<-rbind((read.table(con.mar_t4[ps]))["TR45_2",])
    con.mar_t4_45_2<-rbind(con.mar_t4_45_2, temp_t4_45_2)

    temp_t5_45_2<-rbind((read.table(con.mar_t5[ps]))["TR45_2",])
    con.mar_t5_45_2<-rbind(con.mar_t5_45_2, temp_t5_45_2)

    
    temp_t1_45_12<-rbind((read.table(con.mar_t1[ps]))["TR45_12",])
    con.mar_t1_45_12<-rbind(con.mar_t1_45_12, temp_t1_45_12)

    temp_t2_45_12<-rbind((read.table(con.mar_t2[ps]))["TR45_12",])
    con.mar_t2_45_12<-rbind(con.mar_t2_45_12, temp_t2_45_12)

    temp_t3_45_12<-rbind((read.table(con.mar_t3[ps]))["TR45_12",])
    con.mar_t3_45_12<-rbind(con.mar_t3_45_12, temp_t3_45_12)

    temp_t4_45_12<-rbind((read.table(con.mar_t4[ps]))["TR45_12",])
    con.mar_t4_45_12<-rbind(con.mar_t4_45_12, temp_t4_45_12)

    temp_t5_45_12<-rbind((read.table(con.mar_t5[ps]))["TR45_12",])
    con.mar_t5_45_12<-rbind(con.mar_t5_45_12, temp_t5_45_12)


    
    
    ##non markov
    
    
    temp_t1_12<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR12",])
    con.mar_nonmar_t1_12<-rbind(con.mar_nonmar_t1_12, temp_t1_12)
    rm(temp_t1_12)
    
    temp_t2_12<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR12",])
    con.mar_nonmar_t2_12<-rbind(con.mar_nonmar_t2_12, temp_t2_12)
    rm(temp_t2_12)
    
    temp_t3_12<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR12",])
    con.mar_nonmar_t3_12<-rbind(con.mar_nonmar_t3_12, temp_t3_12)
    rm(temp_t3_12)
    
    temp_t4_12<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR12",])
    con.mar_nonmar_t4_12<-rbind(con.mar_nonmar_t4_12, temp_t4_12)
    rm(temp_t4_12)
    
    temp_t5_12<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR12",])
    con.mar_nonmar_t5_12<-rbind(con.mar_nonmar_t5_12, temp_t5_12)
    rm(temp_t5_12)
    
    
    temp_t1_13<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR13",])
    con.mar_nonmar_t1_13<-rbind(con.mar_nonmar_t1_13, temp_t1_13)
    rm(temp_t1_13)
    
    temp_t2_13<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR13",])
    con.mar_nonmar_t2_13<-rbind(con.mar_nonmar_t2_13, temp_t2_13)
    rm(temp_t2_13)
    
    temp_t3_13<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR13",])
    con.mar_nonmar_t3_13<-rbind(con.mar_nonmar_t3_13, temp_t3_13)
    rm(temp_t3_13)
    
    temp_t4_13<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR13",])
    con.mar_nonmar_t4_13<-rbind(con.mar_nonmar_t4_13, temp_t4_13)
    rm(temp_t4_13)
    
    temp_t5_13<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR13",])
    con.mar_nonmar_t5_13<-rbind(con.mar_nonmar_t5_13, temp_t5_13)
    rm(temp_t5_13)
    
    
    
    temp_t1_14<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR14",])
    con.mar_nonmar_t1_14<-rbind(con.mar_nonmar_t1_14, temp_t1_14)
    rm(temp_t1_14)
    
    temp_t2_14<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR14",])
    con.mar_nonmar_t2_14<-rbind(con.mar_nonmar_t2_14, temp_t2_14)
    rm(temp_t2_14)
    
    temp_t3_14<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR14",])
    con.mar_nonmar_t3_14<-rbind(con.mar_nonmar_t3_14, temp_t3_14)
    rm(temp_t3_14)
    
    temp_t4_14<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR14",])
    con.mar_nonmar_t4_14<-rbind(con.mar_nonmar_t4_14, temp_t4_14)
    rm(temp_t4_14)
    
    temp_t5_14<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR14",])
    con.mar_nonmar_t5_14<-rbind(con.mar_nonmar_t5_14, temp_t5_14)
    rm(temp_t5_14)
    
    
    temp_t1_15<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR15",])
    con.mar_nonmar_t1_15<-rbind(con.mar_nonmar_t1_15, temp_t1_15)
    rm(temp_t1_15)
    
    temp_t2_15<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR15",])
    con.mar_nonmar_t2_15<-rbind(con.mar_nonmar_t2_15, temp_t2_15)
    rm(temp_t2_15)
    
    temp_t3_15<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR15",])
    con.mar_nonmar_t3_15<-rbind(con.mar_nonmar_t3_15, temp_t3_15)
    rm(temp_t3_15)
    
    temp_t4_15<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR15",])
    con.mar_nonmar_t4_15<-rbind(con.mar_nonmar_t4_15, temp_t4_15)
    rm(temp_t4_15)
    
    temp_t5_15<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR15",])
    con.mar_nonmar_t5_15<-rbind(con.mar_nonmar_t5_15, temp_t5_15)
    rm(temp_t5_15)
    
    
    
    temp_t1_23<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR23",])
    con.mar_nonmar_t1_23<-rbind(con.mar_nonmar_t1_23, temp_t1_23)
    rm(temp_t1_23)
    
    temp_t2_23<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR23",])
    con.mar_nonmar_t2_23<-rbind(con.mar_nonmar_t2_23, temp_t2_23)
    rm(temp_t2_23)
    
    temp_t3_23<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR23",])
    con.mar_nonmar_t3_23<-rbind(con.mar_nonmar_t3_23, temp_t3_23)
    rm(temp_t3_23)
    
    temp_t4_23<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR23",])
    con.mar_nonmar_t4_23<-rbind(con.mar_nonmar_t4_23, temp_t4_23)
    rm(temp_t4_23)
    
    temp_t5_23<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR23",])
    con.mar_nonmar_t5_23<-rbind(con.mar_nonmar_t5_23, temp_t5_23)
    rm(temp_t5_23)
    
    
    temp_t1_24<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR24",])
    con.mar_nonmar_t1_24<-rbind(con.mar_nonmar_t1_24, temp_t1_24)
    rm(temp_t1_24)
    
    temp_t2_24<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR24",])
    con.mar_nonmar_t2_24<-rbind(con.mar_nonmar_t2_24, temp_t2_24)
    rm(temp_t2_24)
    
    temp_t3_24<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR24",])
    con.mar_nonmar_t3_24<-rbind(con.mar_nonmar_t3_24, temp_t3_24)
    rm(temp_t3_24)
    
    temp_t4_24<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR24",])
    con.mar_nonmar_t4_24<-rbind(con.mar_nonmar_t4_24, temp_t4_24)
    rm(temp_t4_24)
    
    temp_t5_24<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR24",])
    con.mar_nonmar_t5_24<-rbind(con.mar_nonmar_t5_24, temp_t5_24)
    rm(temp_t5_24)
    
    
    
    temp_t1_25<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR25",])
    con.mar_nonmar_t1_25<-rbind(con.mar_nonmar_t1_25, temp_t1_25)
    rm(temp_t1_25)
    
    temp_t2_25<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR25",])
    con.mar_nonmar_t2_25<-rbind(con.mar_nonmar_t2_25, temp_t2_25)
    rm(temp_t2_25)
    
    temp_t3_25<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR25",])
    con.mar_nonmar_t3_25<-rbind(con.mar_nonmar_t3_25, temp_t3_25)
    rm(temp_t3_25)
    
    temp_t4_25<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR25",])
    con.mar_nonmar_t4_25<-rbind(con.mar_nonmar_t4_25, temp_t4_25)
    rm(temp_t4_25)
    
    temp_t5_25<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR25",])
    con.mar_nonmar_t5_25<-rbind(con.mar_nonmar_t5_25, temp_t5_25)
    rm(temp_t5_25)
    
    
    
    temp_t1_34_0<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR34_0",])
    con.mar_nonmar_t1_34_0<-rbind(con.mar_nonmar_t1_34_0, temp_t1_34_0)

    temp_t2_34_0<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR34_0",])
    con.mar_nonmar_t2_34_0<-rbind(con.mar_nonmar_t2_34_0, temp_t2_34_0)

    temp_t3_34_0<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR34_0",])
    con.mar_nonmar_t3_34_0<-rbind(con.mar_nonmar_t3_34_0, temp_t3_34_0)

    temp_t4_34_0<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR34_0",])
    con.mar_nonmar_t4_34_0<-rbind(con.mar_nonmar_t4_34_0, temp_t4_34_0)

    temp_t5_34_0<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR34_0",])
    con.mar_nonmar_t5_34_0<-rbind(con.mar_nonmar_t5_34_0, temp_t5_34_0)

    temp_t1_34_1<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR34_1",])
    con.mar_nonmar_t1_34_1<-rbind(con.mar_nonmar_t1_34_1, temp_t1_34_1)

    temp_t2_34_1<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR34_1",])
    con.mar_nonmar_t2_34_1<-rbind(con.mar_nonmar_t2_34_1, temp_t2_34_1)

    temp_t3_34_1<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR34_1",])
    con.mar_nonmar_t3_34_1<-rbind(con.mar_nonmar_t3_34_1, temp_t3_34_1)

    temp_t4_34_1<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR34_1",])
    con.mar_nonmar_t4_34_1<-rbind(con.mar_nonmar_t4_34_1, temp_t4_34_1)

    temp_t5_34_1<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR34_1",])
    con.mar_nonmar_t5_34_1<-rbind(con.mar_nonmar_t5_34_1, temp_t5_34_1)

    
    temp_t1_35_1<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR35_1",])
    con.mar_nonmar_t1_35_1<-rbind(con.mar_nonmar_t1_35_1, temp_t1_35_1)

    temp_t2_35_1<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR35_1",])
    con.mar_nonmar_t2_35_1<-rbind(con.mar_nonmar_t2_35_1, temp_t2_35_1)

    temp_t3_35_1<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR35_1",])
    con.mar_nonmar_t3_35_1<-rbind(con.mar_nonmar_t3_35_1, temp_t3_35_1)

    temp_t4_35_1<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR35_1",])
    con.mar_nonmar_t4_35_1<-rbind(con.mar_nonmar_t4_35_1, temp_t4_35_1)

    temp_t5_35_1<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR35_1",])
    con.mar_nonmar_t5_35_1<-rbind(con.mar_nonmar_t5_35_1, temp_t5_35_1)

    
    temp_t1_35_0<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR35_0",])
    con.mar_nonmar_t1_35_0<-rbind(con.mar_nonmar_t1_35_0, temp_t1_35_0)

    temp_t2_35_0<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR35_0",])
    con.mar_nonmar_t2_35_0<-rbind(con.mar_nonmar_t2_35_0, temp_t2_35_0)

    temp_t3_35_0<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR35_0",])
    con.mar_nonmar_t3_35_0<-rbind(con.mar_nonmar_t3_35_0, temp_t3_35_0)

    temp_t4_35_0<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR35_0",])
    con.mar_nonmar_t4_35_0<-rbind(con.mar_nonmar_t4_35_0, temp_t4_35_0)

    temp_t5_35_0<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR35_0",])
    con.mar_nonmar_t5_35_0<-rbind(con.mar_nonmar_t5_35_0, temp_t5_35_0)

    
    temp_t1_45_0<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR45_0",])
    con.mar_nonmar_t1_45_0<-rbind(con.mar_nonmar_t1_45_0, temp_t1_45_0)

    temp_t2_45_0<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR45_0",])
    con.mar_nonmar_t2_45_0<-rbind(con.mar_nonmar_t2_45_0, temp_t2_45_0)

    temp_t3_45_0<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR45_0",])
    con.mar_nonmar_t3_45_0<-rbind(con.mar_nonmar_t3_45_0, temp_t3_45_0)

    temp_t4_45_0<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR45_0",])
    con.mar_nonmar_t4_45_0<-rbind(con.mar_nonmar_t4_45_0, temp_t4_45_0)

    temp_t5_45_0<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR45_0",])
    con.mar_nonmar_t5_45_0<-rbind(con.mar_nonmar_t5_45_0, temp_t5_45_0)

    
    
    temp_t1_45_1<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR45_1",])
    con.mar_nonmar_t1_45_1<-rbind(con.mar_nonmar_t1_45_1, temp_t1_45_1)

    temp_t2_45_1<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR45_1",])
    con.mar_nonmar_t2_45_1<-rbind(con.mar_nonmar_t2_45_1, temp_t2_45_1)

    temp_t3_45_1<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR45_1",])
    con.mar_nonmar_t3_45_1<-rbind(con.mar_nonmar_t3_45_1, temp_t3_45_1)

    temp_t4_45_1<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR45_1",])
    con.mar_nonmar_t4_45_1<-rbind(con.mar_nonmar_t4_45_1, temp_t4_45_1)

    temp_t5_45_1<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR45_1",])
    con.mar_nonmar_t5_45_1<-rbind(con.mar_nonmar_t5_45_1, temp_t5_45_1)

    temp_t1_45_2<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR45_2",])
    con.mar_nonmar_t1_45_2<-rbind(con.mar_nonmar_t1_45_2, temp_t1_45_2)

    temp_t2_45_2<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR45_2",])
    con.mar_nonmar_t2_45_2<-rbind(con.mar_nonmar_t2_45_2, temp_t2_45_2)

    temp_t3_45_2<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR45_2",])
    con.mar_nonmar_t3_45_2<-rbind(con.mar_nonmar_t3_45_2, temp_t3_45_2)

    temp_t4_45_2<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR45_2",])
    con.mar_nonmar_t4_45_2<-rbind(con.mar_nonmar_t4_45_2, temp_t4_45_2)

    temp_t5_45_2<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR45_2",])
    con.mar_nonmar_t5_45_2<-rbind(con.mar_nonmar_t5_45_2, temp_t5_45_2)

    temp_t1_45_12<-rbind((read.table(con.mar_nonmar_t1[ps]))["TR45_12",])
    con.mar_nonmar_t1_45_12<-rbind(con.mar_nonmar_t1_45_12, temp_t1_45_12)

    temp_t2_45_12<-rbind((read.table(con.mar_nonmar_t2[ps]))["TR45_12",])
    con.mar_nonmar_t2_45_12<-rbind(con.mar_nonmar_t2_45_12, temp_t2_45_12)

    temp_t3_45_12<-rbind((read.table(con.mar_nonmar_t3[ps]))["TR45_12",])
    con.mar_nonmar_t3_45_12<-rbind(con.mar_nonmar_t3_45_12, temp_t3_45_12)

    temp_t4_45_12<-rbind((read.table(con.mar_nonmar_t4[ps]))["TR45_12",])
    con.mar_nonmar_t4_45_12<-rbind(con.mar_nonmar_t4_45_12, temp_t4_45_12)

    temp_t5_45_12<-rbind((read.table(con.mar_nonmar_t5[ps]))["TR45_12",])
    con.mar_nonmar_t5_45_12<-rbind(con.mar_nonmar_t5_45_12, temp_t5_45_12)

 
  }
}


##check extreme values due to Cox model break down



con.mar_t1_12 <- con.mar_t1_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t1_13 <- con.mar_t1_13 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t1_14 <- con.mar_t1_14 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t1_15 <- con.mar_t1_15 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t1_23 <- con.mar_t1_23 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t1_24 <- con.mar_t1_24 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t1_25 <- con.mar_t1_25 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t1_34_0 <- con.mar_t1_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t1_35_0 <- con.mar_t1_35_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t1_34_1 <- con.mar_t1_34_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t1_35_1 <- con.mar_t1_35_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t1_34_0 <- con.mar_t1_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t1_45_0 <- con.mar_t1_45_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t1_45_1 <- con.mar_t1_45_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t1_45_2 <- con.mar_t1_45_2 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t1_45_12 <- con.mar_t1_45_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t2_12 <- con.mar_t2_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t2_13 <- con.mar_t2_13 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t2_14 <- con.mar_t2_14 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t2_15 <- con.mar_t2_15 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t2_23 <- con.mar_t2_23 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t2_24 <- con.mar_t2_24 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t2_25 <- con.mar_t2_25 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t2_34_0 <- con.mar_t2_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t2_35_0 <- con.mar_t2_35_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t2_34_1 <- con.mar_t2_34_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t2_35_1 <- con.mar_t2_35_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t2_34_0 <- con.mar_t2_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t2_45_0 <- con.mar_t2_45_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t2_45_1 <- con.mar_t2_45_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t2_45_2 <- con.mar_t2_45_2 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t2_45_12 <- con.mar_t2_45_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t3_12 <- con.mar_t3_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t3_13 <- con.mar_t3_13 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t3_14 <- con.mar_t3_14 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t3_15 <- con.mar_t3_15 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t3_23 <- con.mar_t3_23 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t3_24 <- con.mar_t3_24 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t3_25 <- con.mar_t3_25 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t3_34_0 <- con.mar_t3_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t3_35_0 <- con.mar_t3_35_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t3_34_1 <- con.mar_t3_34_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t3_35_1 <- con.mar_t3_35_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t3_34_0 <- con.mar_t3_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t3_45_0 <- con.mar_t3_45_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t3_45_1 <- con.mar_t3_45_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t3_45_2 <- con.mar_t3_45_2 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t3_45_12 <- con.mar_t3_45_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t4_12 <- con.mar_t4_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t4_13 <- con.mar_t4_13 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t4_14 <- con.mar_t4_14 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t4_15 <- con.mar_t4_15 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t4_23 <- con.mar_t4_23 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t4_24 <- con.mar_t4_24 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t4_25 <- con.mar_t4_25 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t4_34_0 <- con.mar_t4_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t4_35_0 <- con.mar_t4_35_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t4_34_1 <- con.mar_t4_34_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t4_35_1 <- con.mar_t4_35_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t4_34_0 <- con.mar_t4_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t4_45_0 <- con.mar_t4_45_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t4_45_1 <- con.mar_t4_45_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t4_45_2 <- con.mar_t4_45_2 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t4_45_12 <- con.mar_t4_45_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t5_12 <- con.mar_t5_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t5_13 <- con.mar_t5_13 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t5_14 <- con.mar_t5_14 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t5_15 <- con.mar_t5_15 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t5_23 <- con.mar_t5_23 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t5_24 <- con.mar_t5_24 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t5_25 <- con.mar_t5_25 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t5_34_0 <- con.mar_t5_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t5_35_0 <- con.mar_t5_35_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t5_34_1 <- con.mar_t5_34_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t5_35_1 <- con.mar_t5_35_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t5_34_0 <- con.mar_t5_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_t5_45_0 <- con.mar_t5_45_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t5_45_1 <- con.mar_t5_45_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t5_45_2 <- con.mar_t5_45_2 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_t5_45_12 <- con.mar_t5_45_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t1_12 <- con.mar_nonmar_t1_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t1_13 <- con.mar_nonmar_t1_13 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t1_14 <- con.mar_nonmar_t1_14 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t1_15 <- con.mar_nonmar_t1_15 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t1_23 <- con.mar_nonmar_t1_23 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t1_24 <- con.mar_nonmar_t1_24 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t1_25 <- con.mar_nonmar_t1_25 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t1_34_0 <- con.mar_nonmar_t1_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t1_35_0 <- con.mar_nonmar_t1_35_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t1_34_1 <- con.mar_nonmar_t1_34_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t1_35_1 <- con.mar_nonmar_t1_35_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t1_34_0 <- con.mar_nonmar_t1_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t1_45_0 <- con.mar_nonmar_t1_45_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t1_45_1 <- con.mar_nonmar_t1_45_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t1_45_2 <- con.mar_nonmar_t1_45_2 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t1_45_12 <- con.mar_nonmar_t1_45_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t2_12 <- con.mar_nonmar_t2_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,
                    ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t2_13 <- con.mar_nonmar_t2_13 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t2_14 <- con.mar_nonmar_t2_14 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t2_15 <- con.mar_nonmar_t2_15 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t2_23 <- con.mar_nonmar_t2_23 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t2_24 <- con.mar_nonmar_t2_24 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t2_25 <- con.mar_nonmar_t2_25 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t2_34_0 <- con.mar_nonmar_t2_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t2_35_0 <- con.mar_nonmar_t2_35_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t2_34_1 <- con.mar_nonmar_t2_34_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t2_35_1 <- con.mar_nonmar_t2_35_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t2_34_0 <- con.mar_nonmar_t2_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t2_45_0 <- con.mar_nonmar_t2_45_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t2_45_1 <- con.mar_nonmar_t2_45_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t2_45_2 <- con.mar_nonmar_t2_45_2 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t2_45_12 <- con.mar_nonmar_t2_45_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t3_12 <- con.mar_nonmar_t3_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t3_13 <- con.mar_nonmar_t3_13 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t3_14 <- con.mar_nonmar_t3_14 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t3_15 <- con.mar_nonmar_t3_15 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t3_23 <- con.mar_nonmar_t3_23 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t3_24 <- con.mar_nonmar_t3_24 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t3_25 <- con.mar_nonmar_t3_25 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t3_34_0 <- con.mar_nonmar_t3_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t3_35_0 <- con.mar_nonmar_t3_35_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t3_34_1 <- con.mar_nonmar_t3_34_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t3_35_1 <- con.mar_nonmar_t3_35_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t3_34_0 <- con.mar_nonmar_t3_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t3_45_0 <- con.mar_nonmar_t3_45_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t3_45_1 <- con.mar_nonmar_t3_45_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t3_45_2 <- con.mar_nonmar_t3_45_2 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t3_45_12 <- con.mar_nonmar_t3_45_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t4_12 <- con.mar_nonmar_t4_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t4_13 <- con.mar_nonmar_t4_13 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t4_14 <- con.mar_nonmar_t4_14 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t4_15 <- con.mar_nonmar_t4_15 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t4_23 <- con.mar_nonmar_t4_23 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t4_24 <- con.mar_nonmar_t4_24 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t4_25 <- con.mar_nonmar_t4_25 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t4_34_0 <- con.mar_nonmar_t4_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t4_35_0 <- con.mar_nonmar_t4_35_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t4_34_1 <- con.mar_nonmar_t4_34_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t4_35_1 <- con.mar_nonmar_t4_35_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t4_34_0 <- con.mar_nonmar_t4_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t4_45_0 <- con.mar_nonmar_t4_45_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t4_45_1 <- con.mar_nonmar_t4_45_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t4_45_2 <- con.mar_nonmar_t4_45_2 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t4_45_12 <- con.mar_nonmar_t4_45_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t5_12 <- con.mar_nonmar_t5_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t5_13 <- con.mar_nonmar_t5_13 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t5_14 <- con.mar_nonmar_t5_14 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t5_15 <- con.mar_nonmar_t5_15 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t5_23 <- con.mar_nonmar_t5_23 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t5_24 <- con.mar_nonmar_t5_24 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t5_25 <- con.mar_nonmar_t5_25 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t5_34_0 <- con.mar_nonmar_t5_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t5_35_0 <- con.mar_nonmar_t5_35_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t5_34_1 <- con.mar_nonmar_t5_34_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t5_35_1 <- con.mar_nonmar_t5_35_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t5_34_0 <- con.mar_nonmar_t5_34_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )


con.mar_nonmar_t5_45_0 <- con.mar_nonmar_t5_45_0 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t5_45_1 <- con.mar_nonmar_t5_45_1 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t5_45_2 <- con.mar_nonmar_t5_45_2 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )

con.mar_nonmar_t5_45_12 <- con.mar_nonmar_t5_45_12 %>% 
  mutate (
    ll = case_when (ul>=100 ~ NA,                     ul<100 ~ll),
    mean = case_when (ul>=100 ~ NA,                     ul<100 ~mean),
    ul = case_when (ul>=100 ~ NA,                     ul<100 ~ul),
  )



##calculate width for markov model

width_markov_t1<-data.frame(cbind(
  rbind(tr_t1),
  con.mar_t1_12$mean, con.mar_t1_13$mean,  con.mar_t1_14$mean,  con.mar_t1_15$mean,
  con.mar_t1_23$mean, con.mar_t1_24$mean,  con.mar_t1_25$mean,  
  con.mar_t1_34_0$mean, con.mar_t1_35_0$mean, 
  con.mar_t1_34_1$mean, con.mar_t1_35_1$mean, 
  con.mar_t1_45_0$mean, con.mar_t1_45_1$mean, con.mar_t1_45_2$mean, con.mar_t1_45_12$mean,
  
  con.mar_t1_12$ll, con.mar_t1_13$ll,  con.mar_t1_14$ll,  con.mar_t1_15$ll,
  con.mar_t1_23$ll, con.mar_t1_24$ll,  con.mar_t1_25$ll,  
  con.mar_t1_34_0$ll, con.mar_t1_35_0$ll, 
  con.mar_t1_34_1$ll, con.mar_t1_35_1$ll, 
  con.mar_t1_45_0$ll,   con.mar_t1_45_1$ll,   con.mar_t1_45_2$ll,   con.mar_t1_45_12$ll, 
  
  con.mar_t1_12$ul, con.mar_t1_13$ul,  con.mar_t1_14$ul,  con.mar_t1_15$ul,
  con.mar_t1_23$ul, con.mar_t1_24$ul,  con.mar_t1_25$ul,  
  con.mar_t1_34_0$ul, con.mar_t1_35_0$ul, 
  con.mar_t1_34_1$ul, con.mar_t1_35_1$ul, 
  con.mar_t1_45_0$ul,   con.mar_t1_45_1$ul,   con.mar_t1_45_2$ul,   con.mar_t1_45_12$ul
)
)



colnames(width_markov_t1)=c("TR12_true","TR13_true","TR14_true","TR15_true","TR23_true","TR24_true","TR25_true",
                            "TR34_0_true","TR35_0_true","TR34_1_true","TR35_1_true",
                            "TR45_0_true", "TR45_1_true", "TR45_2_true", "TR45_12_true",
                            
                            "TR12","TR13","TR14","TR15","TR23","TR24","TR25",
                            "TR34_0","TR35_0","TR34_1","TR35_1","TR45_0","TR45_1","TR45_2","TR45_12",
                            
                            "TR12_ll","TR13_ll","TR14_ll","TR15_ll","TR23_ll","TR24_ll","TR25_ll",
                            "TR34_0_ll","TR35_0_ll","TR34_1_ll","TR35_1_ll","TR45_0_ll","TR45_1_ll","TR45_2_ll","TR45_12_ll",
                            
                            "TR12_ul","TR13_ul","TR14_ul","TR15_ul","TR23_ul","TR24_ul","TR25_ul",
                            "TR34_0_ul","TR35_0_ul","TR34_1_ul","TR35_1_ul","TR45_0_ul","TR45_1_ul","TR45_2_ul","TR45_12_ul")


width_markov_t2<-data.frame(cbind(
  rbind(tr_t2),
  con.mar_t2_12$mean, con.mar_t2_13$mean,  con.mar_t2_14$mean,  con.mar_t2_15$mean,
  con.mar_t2_23$mean, con.mar_t2_24$mean,  con.mar_t2_25$mean,  
  con.mar_t2_34_0$mean, con.mar_t2_35_0$mean, 
  con.mar_t2_34_1$mean, con.mar_t2_35_1$mean, 
  con.mar_t2_45_0$mean, con.mar_t2_45_1$mean, con.mar_t2_45_2$mean, con.mar_t2_45_12$mean,
  
  con.mar_t2_12$ll, con.mar_t2_13$ll,  con.mar_t2_14$ll,  con.mar_t2_15$ll,
  con.mar_t2_23$ll, con.mar_t2_24$ll,  con.mar_t2_25$ll,  
  con.mar_t2_34_0$ll, con.mar_t2_35_0$ll, 
  con.mar_t2_34_1$ll, con.mar_t2_35_1$ll, 
  con.mar_t2_45_0$ll,   con.mar_t2_45_1$ll,   con.mar_t2_45_2$ll,   con.mar_t2_45_12$ll, 
  
  con.mar_t2_12$ul, con.mar_t2_13$ul,  con.mar_t2_14$ul,  con.mar_t2_15$ul,
  con.mar_t2_23$ul, con.mar_t2_24$ul,  con.mar_t2_25$ul,  
  con.mar_t2_34_0$ul, con.mar_t2_35_0$ul, 
  con.mar_t2_34_1$ul, con.mar_t2_35_1$ul, 
  con.mar_t2_45_0$ul,   con.mar_t2_45_1$ul,   con.mar_t2_45_2$ul,   con.mar_t2_45_12$ul
)
)


width_markov_t3<-data.frame(cbind(
  rbind(tr_t3),
  con.mar_t3_12$mean, con.mar_t3_13$mean,  con.mar_t3_14$mean,  con.mar_t3_15$mean,
  con.mar_t3_23$mean, con.mar_t3_24$mean,  con.mar_t3_25$mean,  
  con.mar_t3_34_0$mean, con.mar_t3_35_0$mean, 
  con.mar_t3_34_1$mean, con.mar_t3_35_1$mean, 
  con.mar_t3_45_0$mean, con.mar_t3_45_1$mean, con.mar_t3_45_2$mean, con.mar_t3_45_12$mean,
  
  con.mar_t3_12$ll, con.mar_t3_13$ll,  con.mar_t3_14$ll,  con.mar_t3_15$ll,
  con.mar_t3_23$ll, con.mar_t3_24$ll,  con.mar_t3_25$ll,  
  con.mar_t3_34_0$ll, con.mar_t3_35_0$ll, 
  con.mar_t3_34_1$ll, con.mar_t3_35_1$ll, 
  con.mar_t3_45_0$ll,   con.mar_t3_45_1$ll,   con.mar_t3_45_2$ll,   con.mar_t3_45_12$ll, 
  
  con.mar_t3_12$ul, con.mar_t3_13$ul,  con.mar_t3_14$ul,  con.mar_t3_15$ul,
  con.mar_t3_23$ul, con.mar_t3_24$ul,  con.mar_t3_25$ul,  
  con.mar_t3_34_0$ul, con.mar_t3_35_0$ul, 
  con.mar_t3_34_1$ul, con.mar_t3_35_1$ul, 
  con.mar_t3_45_0$ul,   con.mar_t3_45_1$ul,   con.mar_t3_45_2$ul,   con.mar_t3_45_12$ul
)
)


width_markov_t4<-data.frame(cbind(
  rbind(tr_t4),
  con.mar_t4_12$mean, con.mar_t4_13$mean,  con.mar_t4_14$mean,  con.mar_t4_15$mean,
  con.mar_t4_23$mean, con.mar_t4_24$mean,  con.mar_t4_25$mean,  
  con.mar_t4_34_0$mean, con.mar_t4_35_0$mean, 
  con.mar_t4_34_1$mean, con.mar_t4_35_1$mean, 
  con.mar_t4_45_0$mean, con.mar_t4_45_1$mean, con.mar_t4_45_2$mean, con.mar_t4_45_12$mean,
  
  con.mar_t4_12$ll, con.mar_t4_13$ll,  con.mar_t4_14$ll,  con.mar_t4_15$ll,
  con.mar_t4_23$ll, con.mar_t4_24$ll,  con.mar_t4_25$ll,  
  con.mar_t4_34_0$ll, con.mar_t4_35_0$ll, 
  con.mar_t4_34_1$ll, con.mar_t4_35_1$ll, 
  con.mar_t4_45_0$ll,   con.mar_t4_45_1$ll,   con.mar_t4_45_2$ll,   con.mar_t4_45_12$ll, 
  
  con.mar_t4_12$ul, con.mar_t4_13$ul,  con.mar_t4_14$ul,  con.mar_t4_15$ul,
  con.mar_t4_23$ul, con.mar_t4_24$ul,  con.mar_t4_25$ul,  
  con.mar_t4_34_0$ul, con.mar_t4_35_0$ul, 
  con.mar_t4_34_1$ul, con.mar_t4_35_1$ul, 
  con.mar_t4_45_0$ul,   con.mar_t4_45_1$ul,   con.mar_t4_45_2$ul,   con.mar_t4_45_12$ul
)
)

width_markov_t5<-data.frame(cbind(
  rbind(tr_t5),
  con.mar_t5_12$mean, con.mar_t5_13$mean,  con.mar_t5_14$mean,  con.mar_t5_15$mean,
  con.mar_t5_23$mean, con.mar_t5_24$mean,  con.mar_t5_25$mean,  
  con.mar_t5_34_0$mean, con.mar_t5_35_0$mean, 
  con.mar_t5_34_1$mean, con.mar_t5_35_1$mean, 
  con.mar_t5_45_0$mean, con.mar_t5_45_1$mean, con.mar_t5_45_2$mean, con.mar_t5_45_12$mean,
  
  con.mar_t5_12$ll, con.mar_t5_13$ll,  con.mar_t5_14$ll,  con.mar_t5_15$ll,
  con.mar_t5_23$ll, con.mar_t5_24$ll,  con.mar_t5_25$ll,  
  con.mar_t5_34_0$ll, con.mar_t5_35_0$ll, 
  con.mar_t5_34_1$ll, con.mar_t5_35_1$ll, 
  con.mar_t5_45_0$ll,   con.mar_t5_45_1$ll,   con.mar_t5_45_2$ll,   con.mar_t5_45_12$ll, 
  
  con.mar_t5_12$ul, con.mar_t5_13$ul,  con.mar_t5_14$ul,  con.mar_t5_15$ul,
  con.mar_t5_23$ul, con.mar_t5_24$ul,  con.mar_t5_25$ul,  
  con.mar_t5_34_0$ul, con.mar_t5_35_0$ul, 
  con.mar_t5_34_1$ul, con.mar_t5_35_1$ul, 
  con.mar_t5_45_0$ul,   con.mar_t5_45_1$ul,   con.mar_t5_45_2$ul,   con.mar_t5_45_12$ul
)
)



colnames(width_markov_t2)=c("TR12_true","TR13_true","TR14_true","TR15_true","TR23_true","TR24_true","TR25_true",
                            "TR34_0_true","TR35_0_true","TR34_1_true","TR35_1_true",
                            "TR45_0_true", "TR45_1_true", "TR45_2_true", "TR45_12_true",
                            "TR12","TR13","TR14","TR15","TR23","TR24","TR25","TR34_0","TR35_0","TR34_1","TR35_1","TR45_0","TR45_1","TR45_2","TR45_12",
                            "TR12_ll","TR13_ll","TR14_ll","TR15_ll","TR23_ll","TR24_ll","TR25_ll","TR34_0_ll","TR35_0_ll","TR34_1_ll","TR35_1_ll","TR45_0_ll","TR45_1_ll","TR45_2_ll","TR45_12_ll",
                            "TR12_ul","TR13_ul","TR14_ul","TR15_ul","TR23_ul","TR24_ul","TR25_ul","TR34_0_ul","TR35_0_ul","TR34_1_ul","TR35_1_ul","TR45_0_ul","TR45_1_ul","TR45_2_ul","TR45_12_ul")




colnames(width_markov_t3)=c("TR12_true","TR13_true","TR14_true","TR15_true","TR23_true","TR24_true","TR25_true",
                            "TR34_0_true","TR35_0_true","TR34_1_true","TR35_1_true",
                            "TR45_0_true", "TR45_1_true", "TR45_2_true", "TR45_12_true",
                            "TR12","TR13","TR14","TR15","TR23","TR24","TR25","TR34_0","TR35_0","TR34_1","TR35_1","TR45_0","TR45_1","TR45_2","TR45_12",
                            "TR12_ll","TR13_ll","TR14_ll","TR15_ll","TR23_ll","TR24_ll","TR25_ll","TR34_0_ll","TR35_0_ll","TR34_1_ll","TR35_1_ll","TR45_0_ll","TR45_1_ll","TR45_2_ll","TR45_12_ll",
                            "TR12_ul","TR13_ul","TR14_ul","TR15_ul","TR23_ul","TR24_ul","TR25_ul","TR34_0_ul","TR35_0_ul","TR34_1_ul","TR35_1_ul","TR45_0_ul","TR45_1_ul","TR45_2_ul","TR45_12_ul")



colnames(width_markov_t4)=c("TR12_true","TR13_true","TR14_true","TR15_true","TR23_true","TR24_true","TR25_true",
                            "TR34_0_true","TR35_0_true","TR34_1_true","TR35_1_true",
                            "TR45_0_true", "TR45_1_true", "TR45_2_true", "TR45_12_true",
                            "TR12","TR13","TR14","TR15","TR23","TR24","TR25","TR34_0","TR35_0","TR34_1","TR35_1","TR45_0","TR45_1","TR45_2","TR45_12",
                            "TR12_ll","TR13_ll","TR14_ll","TR15_ll","TR23_ll","TR24_ll","TR25_ll","TR34_0_ll","TR35_0_ll","TR34_1_ll","TR35_1_ll","TR45_0_ll","TR45_1_ll","TR45_2_ll","TR45_12_ll",
                            "TR12_ul","TR13_ul","TR14_ul","TR15_ul","TR23_ul","TR24_ul","TR25_ul","TR34_0_ul","TR35_0_ul","TR34_1_ul","TR35_1_ul","TR45_0_ul","TR45_1_ul","TR45_2_ul","TR45_12_ul")




colnames(width_markov_t5)=c("TR12_true","TR13_true","TR14_true","TR15_true","TR23_true","TR24_true","TR25_true",
                            "TR34_0_true","TR35_0_true","TR34_1_true","TR35_1_true",
                            "TR45_0_true", "TR45_1_true", "TR45_2_true", "TR45_12_true",
                            "TR12","TR13","TR14","TR15","TR23","TR24","TR25","TR34_0","TR35_0","TR34_1","TR35_1","TR45_0","TR45_1","TR45_2","TR45_12",
                            "TR12_ll","TR13_ll","TR14_ll","TR15_ll","TR23_ll","TR24_ll","TR25_ll","TR34_0_ll","TR35_0_ll","TR34_1_ll","TR35_1_ll","TR45_0_ll","TR45_1_ll","TR45_2_ll","TR45_12_ll",
                            "TR12_ul","TR13_ul","TR14_ul","TR15_ul","TR23_ul","TR24_ul","TR25_ul","TR34_0_ul","TR35_0_ul","TR34_1_ul","TR35_1_ul","TR45_0_ul","TR45_1_ul","TR45_2_ul","TR45_12_ul")




width_nonmarkov_t1<-data.frame(cbind(
  rbind(tr_t1),
  con.mar_nonmar_t1_12$mean, con.mar_nonmar_t1_13$mean,  con.mar_nonmar_t1_14$mean,  con.mar_nonmar_t1_15$mean,
  con.mar_nonmar_t1_23$mean, con.mar_nonmar_t1_24$mean,  con.mar_nonmar_t1_25$mean,  
  con.mar_nonmar_t1_34_0$mean, con.mar_nonmar_t1_35_0$mean, 
  con.mar_nonmar_t1_34_1$mean, con.mar_nonmar_t1_35_1$mean, 
  con.mar_nonmar_t1_45_0$mean, con.mar_nonmar_t1_45_1$mean, con.mar_nonmar_t1_45_2$mean, con.mar_nonmar_t1_45_12$mean,
  
  con.mar_nonmar_t1_12$ll, con.mar_nonmar_t1_13$ll,  con.mar_nonmar_t1_14$ll,  con.mar_nonmar_t1_15$ll,
  con.mar_nonmar_t1_23$ll, con.mar_nonmar_t1_24$ll,  con.mar_nonmar_t1_25$ll,  
  con.mar_nonmar_t1_34_0$ll, con.mar_nonmar_t1_35_0$ll,   con.mar_nonmar_t1_34_1$ll, con.mar_nonmar_t1_35_1$ll, 
  con.mar_nonmar_t1_45_0$ll,   con.mar_nonmar_t1_45_1$ll,   con.mar_nonmar_t1_45_2$ll,   con.mar_nonmar_t1_45_12$ll, 
  
  con.mar_nonmar_t1_12$ul, con.mar_nonmar_t1_13$ul,  con.mar_nonmar_t1_14$ul,  con.mar_nonmar_t1_15$ul,
  con.mar_nonmar_t1_23$ul, con.mar_nonmar_t1_24$ul,  con.mar_nonmar_t1_25$ul,  
  con.mar_nonmar_t1_34_0$ul, con.mar_nonmar_t1_35_0$ul,   con.mar_nonmar_t1_34_1$ul, con.mar_nonmar_t1_35_1$ul, 
  con.mar_nonmar_t1_45_0$ul,   con.mar_nonmar_t1_45_1$ul,   con.mar_nonmar_t1_45_2$ul,   con.mar_nonmar_t1_45_12$ul
)
)



colnames(width_nonmarkov_t1)=c("TR12_true","TR13_true","TR14_true","TR15_true","TR23_true","TR24_true","TR25_true",
                               "TR34_0_true","TR35_0_true","TR34_1_true","TR35_1_true",
                               "TR45_0_true", "TR45_1_true", "TR45_2_true", "TR45_12_true",
                               "TR12","TR13","TR14","TR15","TR23","TR24","TR25","TR34_0","TR35_0","TR34_1","TR35_1","TR45_0","TR45_1","TR45_2","TR45_12",
                               "TR12_ll","TR13_ll","TR14_ll","TR15_ll","TR23_ll","TR24_ll","TR25_ll","TR34_0_ll","TR35_0_ll","TR34_1_ll","TR35_1_ll","TR45_0_ll","TR45_1_ll","TR45_2_ll","TR45_12_ll",
                               "TR12_ul","TR13_ul","TR14_ul","TR15_ul","TR23_ul","TR24_ul","TR25_ul","TR34_0_ul","TR35_0_ul","TR34_1_ul","TR35_1_ul","TR45_0_ul","TR45_1_ul","TR45_2_ul","TR45_12_ul")


width_nonmarkov_t2<-data.frame(cbind(
  rbind(tr_t2),
  con.mar_nonmar_t2_12$mean, con.mar_nonmar_t2_13$mean,  con.mar_nonmar_t2_14$mean,  con.mar_nonmar_t2_15$mean,
  con.mar_nonmar_t2_23$mean, con.mar_nonmar_t2_24$mean,  con.mar_nonmar_t2_25$mean,  
  con.mar_nonmar_t2_34_0$mean, con.mar_nonmar_t2_35_0$mean, 
  con.mar_nonmar_t2_34_1$mean, con.mar_nonmar_t2_35_1$mean, 
  con.mar_nonmar_t2_45_0$mean, con.mar_nonmar_t2_45_1$mean, con.mar_nonmar_t2_45_2$mean, con.mar_nonmar_t2_45_12$mean,
  
  con.mar_nonmar_t2_12$ll, con.mar_nonmar_t2_13$ll,  con.mar_nonmar_t2_14$ll,  con.mar_nonmar_t2_15$ll,
  con.mar_nonmar_t2_23$ll, con.mar_nonmar_t2_24$ll,  con.mar_nonmar_t2_25$ll,  
  con.mar_nonmar_t2_34_0$ll, con.mar_nonmar_t2_35_0$ll, 
  con.mar_nonmar_t2_34_1$ll, con.mar_nonmar_t2_35_1$ll, 
  con.mar_nonmar_t2_45_0$ll,   con.mar_nonmar_t2_45_1$ll,   con.mar_nonmar_t2_45_2$ll,   con.mar_nonmar_t2_45_12$ll, 
  
  con.mar_nonmar_t2_12$ul, con.mar_nonmar_t2_13$ul,  con.mar_nonmar_t2_14$ul,  con.mar_nonmar_t2_15$ul,
  con.mar_nonmar_t2_23$ul, con.mar_nonmar_t2_24$ul,  con.mar_nonmar_t2_25$ul,  
  con.mar_nonmar_t2_34_0$ul, con.mar_nonmar_t2_35_0$ul,   con.mar_nonmar_t2_34_1$ul, con.mar_nonmar_t2_35_1$ul, 
  con.mar_nonmar_t2_45_0$ul,   con.mar_nonmar_t2_45_1$ul,   con.mar_nonmar_t2_45_2$ul,   con.mar_nonmar_t2_45_12$ul
)
)



colnames(width_nonmarkov_t2)=c("TR12_true","TR13_true","TR14_true","TR15_true","TR23_true","TR24_true","TR25_true",
                               "TR34_0_true","TR35_0_true","TR34_1_true","TR35_1_true",
                               "TR45_0_true", "TR45_1_true", "TR45_2_true", "TR45_12_true",
                               "TR12","TR13","TR14","TR15","TR23","TR24","TR25","TR34_0","TR35_0","TR34_1","TR35_1","TR45_0","TR45_1","TR45_2","TR45_12",
                               "TR12_ll","TR13_ll","TR14_ll","TR15_ll","TR23_ll","TR24_ll","TR25_ll","TR34_0_ll","TR35_0_ll","TR34_1_ll","TR35_1_ll","TR45_0_ll","TR45_1_ll","TR45_2_ll","TR45_12_ll",
                               "TR12_ul","TR13_ul","TR14_ul","TR15_ul","TR23_ul","TR24_ul","TR25_ul","TR34_0_ul","TR35_0_ul","TR34_1_ul","TR35_1_ul","TR45_0_ul","TR45_1_ul","TR45_2_ul","TR45_12_ul")




width_nonmarkov_t3<-data.frame(cbind(
  rbind(tr_t3),
  con.mar_nonmar_t3_12$mean, con.mar_nonmar_t3_13$mean,  con.mar_nonmar_t3_14$mean,  con.mar_nonmar_t3_15$mean,
  con.mar_nonmar_t3_23$mean, con.mar_nonmar_t3_24$mean,  con.mar_nonmar_t3_25$mean,  
  con.mar_nonmar_t3_34_0$mean, con.mar_nonmar_t3_35_0$mean, 
  con.mar_nonmar_t3_34_1$mean, con.mar_nonmar_t3_35_1$mean, 
  con.mar_nonmar_t3_45_0$mean, con.mar_nonmar_t3_45_1$mean, con.mar_nonmar_t3_45_2$mean, con.mar_nonmar_t3_45_12$mean,
  
  con.mar_nonmar_t3_12$ll, con.mar_nonmar_t3_13$ll,  con.mar_nonmar_t3_14$ll,  con.mar_nonmar_t3_15$ll,
  con.mar_nonmar_t3_23$ll, con.mar_nonmar_t3_24$ll,  con.mar_nonmar_t3_25$ll,  
  con.mar_nonmar_t3_34_0$ll, con.mar_nonmar_t3_35_0$ll, 
  con.mar_nonmar_t3_34_1$ll, con.mar_nonmar_t3_35_1$ll, 
  con.mar_nonmar_t3_45_0$ll,   con.mar_nonmar_t3_45_1$ll,   con.mar_nonmar_t3_45_2$ll,   con.mar_nonmar_t3_45_12$ll, 
  
  con.mar_nonmar_t3_12$ul, con.mar_nonmar_t3_13$ul,  con.mar_nonmar_t3_14$ul,  con.mar_nonmar_t3_15$ul,
  con.mar_nonmar_t3_23$ul, con.mar_nonmar_t3_24$ul,  con.mar_nonmar_t3_25$ul,  
  con.mar_nonmar_t3_34_0$ul, con.mar_nonmar_t3_35_0$ul,   con.mar_nonmar_t3_34_1$ul, con.mar_nonmar_t3_35_1$ul, 
  con.mar_nonmar_t3_45_0$ul,   con.mar_nonmar_t3_45_1$ul,   con.mar_nonmar_t3_45_2$ul,   con.mar_nonmar_t3_45_12$ul
)
)



colnames(width_nonmarkov_t3)=c("TR12_true","TR13_true","TR14_true","TR15_true","TR23_true","TR24_true","TR25_true",
                               "TR34_0_true","TR35_0_true","TR34_1_true","TR35_1_true",
                               "TR45_0_true", "TR45_1_true", "TR45_2_true", "TR45_12_true",
                               "TR12","TR13","TR14","TR15","TR23","TR24","TR25","TR34_0","TR35_0","TR34_1","TR35_1","TR45_0","TR45_1","TR45_2","TR45_12",
                               "TR12_ll","TR13_ll","TR14_ll","TR15_ll","TR23_ll","TR24_ll","TR25_ll","TR34_0_ll","TR35_0_ll","TR34_1_ll","TR35_1_ll","TR45_0_ll","TR45_1_ll","TR45_2_ll","TR45_12_ll",
                               "TR12_ul","TR13_ul","TR14_ul","TR15_ul","TR23_ul","TR24_ul","TR25_ul","TR34_0_ul","TR35_0_ul","TR34_1_ul","TR35_1_ul","TR45_0_ul","TR45_1_ul","TR45_2_ul","TR45_12_ul")


width_nonmarkov_t4<-data.frame(cbind(
  rbind(tr_t4),
  con.mar_nonmar_t4_12$mean, con.mar_nonmar_t4_13$mean,  con.mar_nonmar_t4_14$mean,  con.mar_nonmar_t4_15$mean,
  con.mar_nonmar_t4_23$mean, con.mar_nonmar_t4_24$mean,  con.mar_nonmar_t4_25$mean,  
  con.mar_nonmar_t4_34_0$mean, con.mar_nonmar_t4_35_0$mean, 
  con.mar_nonmar_t4_34_1$mean, con.mar_nonmar_t4_35_1$mean, 
  con.mar_nonmar_t4_45_0$mean, con.mar_nonmar_t4_45_1$mean, con.mar_nonmar_t4_45_2$mean, con.mar_nonmar_t4_45_12$mean,
  
  con.mar_nonmar_t4_12$ll, con.mar_nonmar_t4_13$ll,  con.mar_nonmar_t4_14$ll,  con.mar_nonmar_t4_15$ll,
  con.mar_nonmar_t4_23$ll, con.mar_nonmar_t4_24$ll,  con.mar_nonmar_t4_25$ll,  
  con.mar_nonmar_t4_34_0$ll, con.mar_nonmar_t4_35_0$ll, 
  con.mar_nonmar_t4_34_1$ll, con.mar_nonmar_t4_35_1$ll, 
  con.mar_nonmar_t4_45_0$ll,   con.mar_nonmar_t4_45_1$ll,   con.mar_nonmar_t4_45_2$ll,   con.mar_nonmar_t4_45_12$ll, 
  
  con.mar_nonmar_t4_12$ul, con.mar_nonmar_t4_13$ul,  con.mar_nonmar_t4_14$ul,  con.mar_nonmar_t4_15$ul,
  con.mar_nonmar_t4_23$ul, con.mar_nonmar_t4_24$ul,  con.mar_nonmar_t4_25$ul,  
  con.mar_nonmar_t4_34_0$ul, con.mar_nonmar_t4_35_0$ul,   con.mar_nonmar_t4_34_1$ul, con.mar_nonmar_t4_35_1$ul, 
  con.mar_nonmar_t4_45_0$ul,   con.mar_nonmar_t4_45_1$ul,   con.mar_nonmar_t4_45_2$ul,   con.mar_nonmar_t4_45_12$ul
)
)



colnames(width_nonmarkov_t4)=c("TR12_true","TR13_true","TR14_true","TR15_true","TR23_true","TR24_true","TR25_true",
                               "TR34_0_true","TR35_0_true","TR34_1_true","TR35_1_true",
                               "TR45_0_true", "TR45_1_true", "TR45_2_true", "TR45_12_true",
                               "TR12","TR13","TR14","TR15","TR23","TR24","TR25","TR34_0","TR35_0","TR34_1","TR35_1","TR45_0","TR45_1","TR45_2","TR45_12",
                               "TR12_ll","TR13_ll","TR14_ll","TR15_ll","TR23_ll","TR24_ll","TR25_ll","TR34_0_ll","TR35_0_ll","TR34_1_ll","TR35_1_ll","TR45_0_ll","TR45_1_ll","TR45_2_ll","TR45_12_ll",
                               "TR12_ul","TR13_ul","TR14_ul","TR15_ul","TR23_ul","TR24_ul","TR25_ul","TR34_0_ul","TR35_0_ul","TR34_1_ul","TR35_1_ul","TR45_0_ul","TR45_1_ul","TR45_2_ul","TR45_12_ul")

width_nonmarkov_t5<-data.frame(cbind(
  rbind(tr_t5),
  con.mar_nonmar_t5_12$mean, con.mar_nonmar_t5_13$mean,  con.mar_nonmar_t5_14$mean,  con.mar_nonmar_t5_15$mean,
  con.mar_nonmar_t5_23$mean, con.mar_nonmar_t5_24$mean,  con.mar_nonmar_t5_25$mean,  
  con.mar_nonmar_t5_34_0$mean, con.mar_nonmar_t5_35_0$mean, 
  con.mar_nonmar_t5_34_1$mean, con.mar_nonmar_t5_35_1$mean, 
  con.mar_nonmar_t5_45_0$mean, con.mar_nonmar_t5_45_1$mean, con.mar_nonmar_t5_45_2$mean, con.mar_nonmar_t5_45_12$mean,
  
  con.mar_nonmar_t5_12$ll, con.mar_nonmar_t5_13$ll,  con.mar_nonmar_t5_14$ll,  con.mar_nonmar_t5_15$ll,
  con.mar_nonmar_t5_23$ll, con.mar_nonmar_t5_24$ll,  con.mar_nonmar_t5_25$ll,  
  con.mar_nonmar_t5_34_0$ll, con.mar_nonmar_t5_35_0$ll, 
  con.mar_nonmar_t5_34_1$ll, con.mar_nonmar_t5_35_1$ll, 
  con.mar_nonmar_t5_45_0$ll,   con.mar_nonmar_t5_45_1$ll,   con.mar_nonmar_t5_45_2$ll,   con.mar_nonmar_t5_45_12$ll, 
  
  con.mar_nonmar_t5_12$ul, con.mar_nonmar_t5_13$ul,  con.mar_nonmar_t5_14$ul,  con.mar_nonmar_t5_15$ul,
  con.mar_nonmar_t5_23$ul, con.mar_nonmar_t5_24$ul,  con.mar_nonmar_t5_25$ul,  
  con.mar_nonmar_t5_34_0$ul, con.mar_nonmar_t5_35_0$ul,   con.mar_nonmar_t5_34_1$ul, con.mar_nonmar_t5_35_1$ul, 
  con.mar_nonmar_t5_45_0$ul,   con.mar_nonmar_t5_45_1$ul,   con.mar_nonmar_t5_45_2$ul,   con.mar_nonmar_t5_45_12$ul
)
)



colnames(width_nonmarkov_t5)=c("TR12_true","TR13_true","TR14_true","TR15_true","TR23_true","TR24_true","TR25_true",
                               "TR34_0_true","TR35_0_true","TR34_1_true","TR35_1_true",
                               "TR45_0_true", "TR45_1_true", "TR45_2_true", "TR45_12_true",
                               "TR12","TR13","TR14","TR15","TR23","TR24","TR25","TR34_0","TR35_0","TR34_1","TR35_1","TR45_0","TR45_1","TR45_2","TR45_12",
                               "TR12_ll","TR13_ll","TR14_ll","TR15_ll","TR23_ll","TR24_ll","TR25_ll","TR34_0_ll","TR35_0_ll","TR34_1_ll","TR35_1_ll","TR45_0_ll","TR45_1_ll","TR45_2_ll","TR45_12_ll",
                               "TR12_ul","TR13_ul","TR14_ul","TR15_ul","TR23_ul","TR24_ul","TR25_ul","TR34_0_ul","TR35_0_ul","TR34_1_ul","TR35_1_ul","TR45_0_ul","TR45_1_ul","TR45_2_ul","TR45_12_ul")







library(dplyr)


width_markov_t1 <-width_markov_t1 %>%
  mutate(
    ##width
    
    tr12_b=(TR12_ul-TR12_ll),
    tr13_b=(TR13_ul-TR13_ll),
    tr14_b=(TR14_ul-TR14_ll),
    tr15_b=(TR15_ul-TR15_ll),
    
    tr23_b=(TR23_ul-TR23_ll),
    tr24_b=(TR24_ul-TR24_ll),
    tr25_b=(TR25_ul-TR25_ll),
    
    tr34_0_b=(TR34_0_ul-TR34_0_ll),
    tr35_0_b=(TR35_0_ul-TR35_0_ll),
    
    tr34_1_b=(TR34_1_ul-TR34_1_ll),
    tr35_1_b=(TR35_1_ul-TR35_1_ll),
    
    tr45_0_b=(TR45_0_ul-TR45_0_ll),
    tr45_1_b=(TR45_1_ul-TR45_1_ll),
    tr45_2_b=(TR45_2_ul-TR45_2_ll),
    tr45_12_b=(TR45_12_ul-TR45_12_ll),
    
    
    ##mse
    
    tr12_mes=(TR12_true-TR12)^2,
    tr13_mes=(TR13_true-TR13)^2,
    tr14_mes=(TR14_true-TR14)^2,
    tr15_mes=(TR15_true-TR15)^2,
    
    tr23_mes=(TR23_true-TR23)^2,
    tr24_mes=(TR24_true-TR24)^2,
    tr25_mes=(TR25_true-TR25)^2,
    
    tr34_0_mes=(TR34_0_true-TR34_0)^2,
    tr35_0_mes=(TR35_0_true-TR35_0)^2,
    
    tr34_1_mes=(TR34_1_true-TR34_1)^2,
    tr35_1_mes=(TR35_1_true-TR35_1)^2,
    
    tr45_0_mes=(TR45_0_true-TR45_0)^2,
    tr45_1_mes=(TR45_1_true-TR45_1)^2,
    tr45_2_mes=(TR45_2_true-TR45_2)^2,
    tr45_12_mes=(TR45_12_true-TR45_12)^2,
    
    
    ##coverage
    
    tr12_cover = case_when(TR12_true<=TR12_ul & TR12_true>=TR12_ll & is.na(TR12_ll)==F ~1,  
                           (TR12_true>TR12_ul | TR12_true<TR12_ll) & is.na(TR12_ll)==F ~0),   
    tr13_cover = case_when(TR13_true<=TR13_ul & TR13_true>=TR13_ll & is.na(TR13_ll)==F ~1,  
                           (TR13_true>TR13_ul | TR13_true<TR13_ll) & is.na(TR13_ll)==F ~0), 
    tr14_cover = case_when(TR14_true<=TR14_ul & TR14_true>=TR14_ll & is.na(TR14_ll)==F ~1,  
                           (TR14_true>TR14_ul | TR14_true<TR14_ll) & is.na(TR14_ll)==F ~0), 
    tr15_cover = case_when(TR15_true<=TR15_ul & TR15_true>=TR15_ll & is.na(TR15_ll)==F ~1,  
                           (TR15_true>TR15_ul | TR15_true<TR15_ll) & is.na(TR15_ll)==F ~0), 
    tr23_cover = case_when(TR23_true<=TR23_ul & TR23_true>=TR23_ll & is.na(TR23_ll)==F ~1,  
                           (TR23_true>TR23_ul | TR23_true<TR23_ll) & is.na(TR23_ll)==F ~0), 
    tr24_cover = case_when(TR24_true<=TR24_ul & TR24_true>=TR24_ll & is.na(TR24_ll)==F ~1,  
                           (TR24_true>TR24_ul | TR24_true<TR24_ll) & is.na(TR24_ll)==F ~0), 
    tr25_cover = case_when(TR25_true<=TR25_ul & TR25_true>=TR25_ll & is.na(TR25_ll)==F ~1,  
                           (TR25_true>TR25_ul | TR25_true<TR25_ll) & is.na(TR25_ll)==F ~0), 
    tr34_0_cover = case_when(TR34_0_true<=TR34_0_ul & TR34_0_true>=TR34_0_ll & is.na(TR34_0_ll)==F ~1,  
                             (TR34_0_true>TR34_0_ul | TR34_0_true<TR34_0_ll) & is.na(TR34_0_ll)==F ~0), 
    tr35_0_cover = case_when(TR35_0_true<=TR35_0_ul & TR35_0_true>=TR35_0_ll & is.na(TR35_0_ll)==F ~1,  
                             (TR35_0_true>TR35_0_ul | TR35_0_true<TR35_0_ll) & is.na(TR35_0_ll)==F ~0), 
    tr34_1_cover = case_when(TR34_1_true<=TR34_1_ul & TR34_1_true>=TR34_1_ll & is.na(TR34_1_ll)==F ~1,  
                             (TR34_1_true>TR34_1_ul | TR34_1_true<TR34_1_ll) & is.na(TR34_1_ll)==F ~0), 
    tr35_1_cover = case_when(TR35_1_true<=TR35_1_ul & TR35_1_true>=TR35_1_ll & is.na(TR35_1_ll)==F ~1,  
                             (TR35_1_true>TR35_1_ul | TR35_1_true<TR35_1_ll) & is.na(TR35_1_ll)==F ~0), 
    tr45_0_cover = case_when(TR45_0_true<=TR45_0_ul & TR45_0_true>=TR45_0_ll & is.na(TR45_0_ll)==F ~1,  
                             (TR45_0_true>TR45_0_ul | TR45_0_true<TR45_0_ll) & is.na(TR45_0_ll)==F ~0), 
    tr45_1_cover = case_when(TR45_1_true<=TR45_1_ul & TR45_1_true>=TR45_1_ll & is.na(TR45_1_ll)==F ~1,  
                             (TR45_1_true>TR45_1_ul | TR45_1_true<TR45_1_ll) & is.na(TR45_1_ll)==F ~0), 
    tr45_2_cover = case_when(TR45_2_true<=TR45_2_ul & TR45_2_true>=TR45_2_ll & is.na(TR45_2_ll)==F ~1,  
                             (TR45_2_true>TR45_2_ul | TR45_2_true<TR45_2_ll) & is.na(TR45_2_ll)==F ~0), 
    tr45_12_cover = case_when(TR45_12_true<=TR45_12_ul & TR45_12_true>=TR45_12_ll & is.na(TR45_12_ll)==F ~1,  
                              (TR45_12_true>TR45_12_ul | TR45_12_true<TR45_12_ll) & is.na(TR45_12_ll)==F ~0), 
    
##power

tr12_power = case_when(0<=TR12_ul & 0>=TR12_ll & TR12_true!=0 ~0, TRUE~1),
tr13_power = case_when(0<=TR13_ul & 0>=TR13_ll & TR13_true!=0 ~0, TRUE~1),
tr14_power = case_when(0<=TR14_ul & 0>=TR14_ll & TR14_true!=0 ~0, TRUE~1),
tr15_power = case_when(0<=TR15_ul & 0>=TR15_ll & TR15_true!=0 ~0, TRUE~1),

tr23_power = case_when(0<=TR23_ul & 0>=TR23_ll & TR23_true!=0 ~0, TRUE~1),
tr24_power = case_when(0<=TR24_ul & 0>=TR24_ll & TR24_true!=0 ~0, TRUE~1),
tr25_power = case_when(0<=TR25_ul & 0>=TR25_ll & TR25_true!=0 ~0, TRUE~1),

tr34_0_power = case_when(0<=TR34_0_ul & 0>=TR34_0_ll & TR34_0_true!=0 ~0, TRUE~1),
tr34_1_power = case_when(0<=TR34_1_ul & 0>=TR34_1_ll & TR34_1_true!=0 ~0, TRUE~1),
tr35_0_power = case_when(0<=TR35_0_ul & 0>=TR35_0_ll & TR35_0_true!=0 ~0, TRUE~1),
tr35_1_power = case_when(0<=TR35_1_ul & 0>=TR35_1_ll & TR35_1_true!=0 ~0, TRUE~1),

tr45_0_power = case_when(0<=TR45_0_ul & 0>=TR45_0_ll & TR45_0_true!=0 ~0, TRUE~1),
tr45_1_power = case_when(0<=TR45_1_ul & 0>=TR45_1_ll & TR45_1_true!=0 ~0, TRUE~1),
tr45_2_power = case_when(0<=TR45_2_ul & 0>=TR45_2_ll & TR45_2_true!=0 ~0, TRUE~1),
tr45_12_power = case_when(0<=TR45_12_ul & 0>=TR45_12_ll & TR45_12_true!=0 ~0, TRUE~1),


    tr_b = rowMeans(across(c(tr12_b, tr13_b, tr14_b, tr15_b, tr23_b, 
                             tr24_b, tr25_b, tr34_0_b, tr35_0_b,tr34_1_b, tr35_1_b, 
                             tr45_0_b,tr45_1_b,tr45_2_b,tr45_12_b)), na.rm=T),
    
    tr_mes = rowMeans(across(c(tr12_mes, tr13_mes, tr14_mes, tr15_mes, tr23_mes, 
                               tr24_mes, tr25_mes, tr34_0_mes, tr35_0_mes,tr34_1_mes, tr35_1_mes, 
                               tr45_0_mes,tr45_1_mes,tr45_2_mes,tr45_12_mes)), na.rm=T),
    
    tr_cover = rowMeans(across(c(tr12_cover, tr13_cover, tr14_cover, tr15_cover, tr23_cover, 
                                 tr24_cover, tr25_cover, tr34_0_cover, tr35_0_cover,tr34_1_cover, tr35_1_cover, 
                                 tr45_0_cover,tr45_1_cover,tr45_2_cover,tr45_12_cover)), na.rm=T),

tr_power = rowMeans(across(c(tr12_power, tr13_power, tr14_power, tr15_power, tr23_power, 
                             tr24_power, tr25_power, tr34_0_power, tr35_0_power,tr34_1_power, tr35_1_power, 
                             tr45_0_power,tr45_1_power,tr45_2_power,tr45_12_power)), na.rm=T)

    
  )

markov_width_t1=mean(c(width_markov_t1$tr_b), na.rm=T)
markov_mes_t1=mean(c(width_markov_t1$tr_mes), na.rm=T)
markov_coverage_t1=mean(c(width_markov_t1$tr_cover), na.rm=T)
markov_power_t1=mean(c(width_markov_t1$tr_power), na.rm=T)


width_markov_t2 <-width_markov_t2 %>%
  mutate(
    ##width
    
    
    tr12_b=(TR12_ul-TR12_ll),
    tr13_b=(TR13_ul-TR13_ll),
    tr14_b=(TR14_ul-TR14_ll),
    tr15_b=(TR15_ul-TR15_ll),
    
    tr23_b=(TR23_ul-TR23_ll),
    tr24_b=(TR24_ul-TR24_ll),
    tr25_b=(TR25_ul-TR25_ll),
    
    tr34_0_b=(TR34_0_ul-TR34_0_ll),
    tr35_0_b=(TR35_0_ul-TR35_0_ll),
    
    tr34_1_b=(TR34_1_ul-TR34_1_ll),
    tr35_1_b=(TR35_1_ul-TR35_1_ll),
    
    tr45_0_b=(TR45_0_ul-TR45_0_ll),
    tr45_1_b=(TR45_1_ul-TR45_1_ll),
    tr45_2_b=(TR45_2_ul-TR45_2_ll),
    tr45_12_b=(TR45_12_ul-TR45_12_ll),
    
    
    ##mse
    
    tr12_mes=(TR12_true-TR12)^2,
    tr13_mes=(TR13_true-TR13)^2,
    tr14_mes=(TR14_true-TR14)^2,
    tr15_mes=(TR15_true-TR15)^2,
    
    tr23_mes=(TR23_true-TR23)^2,
    tr24_mes=(TR24_true-TR24)^2,
    tr25_mes=(TR25_true-TR25)^2,
    
    tr34_0_mes=(TR34_0_true-TR34_0)^2,
    tr35_0_mes=(TR35_0_true-TR35_0)^2,
    
    tr34_1_mes=(TR34_1_true-TR34_1)^2,
    tr35_1_mes=(TR35_1_true-TR35_1)^2,
    
    tr45_0_mes=(TR45_0_true-TR45_0)^2,
    tr45_1_mes=(TR45_1_true-TR45_1)^2,
    tr45_2_mes=(TR45_2_true-TR45_2)^2,
    tr45_12_mes=(TR45_12_true-TR45_12)^2,
    
    
    ##coverage
    
    tr12_cover = case_when(TR12_true<=TR12_ul & TR12_true>=TR12_ll & is.na(TR12_ll)==F ~1,  
                           (TR12_true>TR12_ul | TR12_true<TR12_ll) & is.na(TR12_ll)==F ~0),   
    tr13_cover = case_when(TR13_true<=TR13_ul & TR13_true>=TR13_ll & is.na(TR13_ll)==F ~1,  
                           (TR13_true>TR13_ul | TR13_true<TR13_ll) & is.na(TR13_ll)==F ~0), 
    tr14_cover = case_when(TR14_true<=TR14_ul & TR14_true>=TR14_ll & is.na(TR14_ll)==F ~1,  
                           (TR14_true>TR14_ul | TR14_true<TR14_ll) & is.na(TR14_ll)==F ~0), 
    tr15_cover = case_when(TR15_true<=TR15_ul & TR15_true>=TR15_ll & is.na(TR15_ll)==F ~1,  
                           (TR15_true>TR15_ul | TR15_true<TR15_ll) & is.na(TR15_ll)==F ~0), 
    tr23_cover = case_when(TR23_true<=TR23_ul & TR23_true>=TR23_ll & is.na(TR23_ll)==F ~1,  
                           (TR23_true>TR23_ul | TR23_true<TR23_ll) & is.na(TR23_ll)==F ~0), 
    tr24_cover = case_when(TR24_true<=TR24_ul & TR24_true>=TR24_ll & is.na(TR24_ll)==F ~1,  
                           (TR24_true>TR24_ul | TR24_true<TR24_ll) & is.na(TR24_ll)==F ~0), 
    tr25_cover = case_when(TR25_true<=TR25_ul & TR25_true>=TR25_ll & is.na(TR25_ll)==F ~1,  
                           (TR25_true>TR25_ul | TR25_true<TR25_ll) & is.na(TR25_ll)==F ~0), 
    tr34_0_cover = case_when(TR34_0_true<=TR34_0_ul & TR34_0_true>=TR34_0_ll & is.na(TR34_0_ll)==F ~1,  
                             (TR34_0_true>TR34_0_ul | TR34_0_true<TR34_0_ll) & is.na(TR34_0_ll)==F ~0), 
    tr35_0_cover = case_when(TR35_0_true<=TR35_0_ul & TR35_0_true>=TR35_0_ll & is.na(TR35_0_ll)==F ~1,  
                             (TR35_0_true>TR35_0_ul | TR35_0_true<TR35_0_ll) & is.na(TR35_0_ll)==F ~0), 
    tr34_1_cover = case_when(TR34_1_true<=TR34_1_ul & TR34_1_true>=TR34_1_ll & is.na(TR34_1_ll)==F ~1,  
                             (TR34_1_true>TR34_1_ul | TR34_1_true<TR34_1_ll) & is.na(TR34_1_ll)==F ~0), 
    tr35_1_cover = case_when(TR35_1_true<=TR35_1_ul & TR35_1_true>=TR35_1_ll & is.na(TR35_1_ll)==F ~1,  
                             (TR35_1_true>TR35_1_ul | TR35_1_true<TR35_1_ll) & is.na(TR35_1_ll)==F ~0), 
    tr45_0_cover = case_when(TR45_0_true<=TR45_0_ul & TR45_0_true>=TR45_0_ll & is.na(TR45_0_ll)==F ~1,  
                             (TR45_0_true>TR45_0_ul | TR45_0_true<TR45_0_ll) & is.na(TR45_0_ll)==F ~0), 
    tr45_1_cover = case_when(TR45_1_true<=TR45_1_ul & TR45_1_true>=TR45_1_ll & is.na(TR45_1_ll)==F ~1,  
                             (TR45_1_true>TR45_1_ul | TR45_1_true<TR45_1_ll) & is.na(TR45_1_ll)==F ~0), 
    tr45_2_cover = case_when(TR45_2_true<=TR45_2_ul & TR45_2_true>=TR45_2_ll & is.na(TR45_2_ll)==F ~1,  
                             (TR45_2_true>TR45_2_ul | TR45_2_true<TR45_2_ll) & is.na(TR45_2_ll)==F ~0), 
    tr45_12_cover = case_when(TR45_12_true<=TR45_12_ul & TR45_12_true>=TR45_12_ll & is.na(TR45_12_ll)==F ~1,  
                              (TR45_12_true>TR45_12_ul | TR45_12_true<TR45_12_ll) & is.na(TR45_12_ll)==F ~0), 
    
    ##power

tr12_power = case_when(0<=TR12_ul & 0>=TR12_ll & TR12_true!=0 ~0, TRUE~1),
tr13_power = case_when(0<=TR13_ul & 0>=TR13_ll & TR13_true!=0 ~0, TRUE~1),
tr14_power = case_when(0<=TR14_ul & 0>=TR14_ll & TR14_true!=0 ~0, TRUE~1),
tr15_power = case_when(0<=TR15_ul & 0>=TR15_ll & TR15_true!=0 ~0, TRUE~1),

tr23_power = case_when(0<=TR23_ul & 0>=TR23_ll & TR23_true!=0 ~0, TRUE~1),
tr24_power = case_when(0<=TR24_ul & 0>=TR24_ll & TR24_true!=0 ~0, TRUE~1),
tr25_power = case_when(0<=TR25_ul & 0>=TR25_ll & TR25_true!=0 ~0, TRUE~1),

tr34_0_power = case_when(0<=TR34_0_ul & 0>=TR34_0_ll & TR34_0_true!=0 ~0, TRUE~1),
tr34_1_power = case_when(0<=TR34_1_ul & 0>=TR34_1_ll & TR34_1_true!=0 ~0, TRUE~1),
tr35_0_power = case_when(0<=TR35_0_ul & 0>=TR35_0_ll & TR35_0_true!=0 ~0, TRUE~1),
tr35_1_power = case_when(0<=TR35_1_ul & 0>=TR35_1_ll & TR35_1_true!=0 ~0, TRUE~1),

tr45_0_power = case_when(0<=TR45_0_ul & 0>=TR45_0_ll & TR45_0_true!=0 ~0, TRUE~1),
tr45_1_power = case_when(0<=TR45_1_ul & 0>=TR45_1_ll & TR45_1_true!=0 ~0, TRUE~1),
tr45_2_power = case_when(0<=TR45_2_ul & 0>=TR45_2_ll & TR45_2_true!=0 ~0, TRUE~1),
tr45_12_power = case_when(0<=TR45_12_ul & 0>=TR45_12_ll & TR45_12_true!=0 ~0, TRUE~1),

    

    tr_b = rowMeans(across(c(tr12_b, tr13_b, tr14_b, tr15_b, tr23_b, 
                             tr24_b, tr25_b, tr34_0_b, tr35_0_b,tr34_1_b, tr35_1_b, 
                             tr45_0_b,tr45_1_b,tr45_2_b,tr45_12_b)), na.rm=T),
    
    tr_mes = rowMeans(across(c(tr12_mes, tr13_mes, tr14_mes, tr15_mes, tr23_mes, 
                               tr24_mes, tr25_mes, tr34_0_mes, tr35_0_mes,tr34_1_mes, tr35_1_mes, 
                               tr45_0_mes,tr45_1_mes,tr45_2_mes,tr45_12_mes)), na.rm=T),
    
    tr_cover = rowMeans(across(c(tr12_cover, tr13_cover, tr14_cover, tr15_cover, tr23_cover, 
                                 tr24_cover, tr25_cover, tr34_0_cover, tr35_0_cover,tr34_1_cover, tr35_1_cover, 
                                 tr45_0_cover,tr45_1_cover,tr45_2_cover,tr45_12_cover)), na.rm=T),

tr_power = rowMeans(across(c(tr12_power, tr13_power, tr14_power, tr15_power, tr23_power, 
                             tr24_power, tr25_power, tr34_0_power, tr35_0_power,tr34_1_power, tr35_1_power, 
                             tr45_0_power,tr45_1_power,tr45_2_power,tr45_12_power)), na.rm=T)


    
  )

markov_width_t2=mean(c(width_markov_t2$tr_b), na.rm=T)
markov_mes_t2=mean(c(width_markov_t2$tr_mes), na.rm=T)
markov_coverage_t2=mean(c(width_markov_t2$tr_cover), na.rm=T)
markov_power_t2=mean(c(width_markov_t2$tr_power), na.rm=T)



width_markov_t3 <-width_markov_t3 %>%
  mutate(
    ##width
    
    
    tr12_b=(TR12_ul-TR12_ll),
    tr13_b=(TR13_ul-TR13_ll),
    tr14_b=(TR14_ul-TR14_ll),
    tr15_b=(TR15_ul-TR15_ll),
    
    tr23_b=(TR23_ul-TR23_ll),
    tr24_b=(TR24_ul-TR24_ll),
    tr25_b=(TR25_ul-TR25_ll),
    
    tr34_0_b=(TR34_0_ul-TR34_0_ll),
    tr35_0_b=(TR35_0_ul-TR35_0_ll),
    
    tr34_1_b=(TR34_1_ul-TR34_1_ll),
    tr35_1_b=(TR35_1_ul-TR35_1_ll),
    
    tr45_0_b=(TR45_0_ul-TR45_0_ll),
    tr45_1_b=(TR45_1_ul-TR45_1_ll),
    tr45_2_b=(TR45_2_ul-TR45_2_ll),
    tr45_12_b=(TR45_12_ul-TR45_12_ll),
    
    
    ##mse
    
    tr12_mes=(TR12_true-TR12)^2,
    tr13_mes=(TR13_true-TR13)^2,
    tr14_mes=(TR14_true-TR14)^2,
    tr15_mes=(TR15_true-TR15)^2,
    
    tr23_mes=(TR23_true-TR23)^2,
    tr24_mes=(TR24_true-TR24)^2,
    tr25_mes=(TR25_true-TR25)^2,
    
    tr34_0_mes=(TR34_0_true-TR34_0)^2,
    tr35_0_mes=(TR35_0_true-TR35_0)^2,
    
    tr34_1_mes=(TR34_1_true-TR34_1)^2,
    tr35_1_mes=(TR35_1_true-TR35_1)^2,
    
    tr45_0_mes=(TR45_0_true-TR45_0)^2,
    tr45_1_mes=(TR45_1_true-TR45_1)^2,
    tr45_2_mes=(TR45_2_true-TR45_2)^2,
    tr45_12_mes=(TR45_12_true-TR45_12)^2,
    
    
    ##coverage
    
    tr12_cover = case_when(TR12_true<=TR12_ul & TR12_true>=TR12_ll & is.na(TR12_ll)==F ~1,  
                           (TR12_true>TR12_ul | TR12_true<TR12_ll) & is.na(TR12_ll)==F ~0),   
    tr13_cover = case_when(TR13_true<=TR13_ul & TR13_true>=TR13_ll & is.na(TR13_ll)==F ~1,  
                           (TR13_true>TR13_ul | TR13_true<TR13_ll) & is.na(TR13_ll)==F ~0), 
    tr14_cover = case_when(TR14_true<=TR14_ul & TR14_true>=TR14_ll & is.na(TR14_ll)==F ~1,  
                           (TR14_true>TR14_ul | TR14_true<TR14_ll) & is.na(TR14_ll)==F ~0), 
    tr15_cover = case_when(TR15_true<=TR15_ul & TR15_true>=TR15_ll & is.na(TR15_ll)==F ~1,  
                           (TR15_true>TR15_ul | TR15_true<TR15_ll) & is.na(TR15_ll)==F ~0), 
    tr23_cover = case_when(TR23_true<=TR23_ul & TR23_true>=TR23_ll & is.na(TR23_ll)==F ~1,  
                           (TR23_true>TR23_ul | TR23_true<TR23_ll) & is.na(TR23_ll)==F ~0), 
    tr24_cover = case_when(TR24_true<=TR24_ul & TR24_true>=TR24_ll & is.na(TR24_ll)==F ~1,  
                           (TR24_true>TR24_ul | TR24_true<TR24_ll) & is.na(TR24_ll)==F ~0), 
    tr25_cover = case_when(TR25_true<=TR25_ul & TR25_true>=TR25_ll & is.na(TR25_ll)==F ~1,  
                           (TR25_true>TR25_ul | TR25_true<TR25_ll) & is.na(TR25_ll)==F ~0), 
    tr34_0_cover = case_when(TR34_0_true<=TR34_0_ul & TR34_0_true>=TR34_0_ll & is.na(TR34_0_ll)==F ~1,  
                             (TR34_0_true>TR34_0_ul | TR34_0_true<TR34_0_ll) & is.na(TR34_0_ll)==F ~0), 
    tr35_0_cover = case_when(TR35_0_true<=TR35_0_ul & TR35_0_true>=TR35_0_ll & is.na(TR35_0_ll)==F ~1,  
                             (TR35_0_true>TR35_0_ul | TR35_0_true<TR35_0_ll) & is.na(TR35_0_ll)==F ~0), 
    tr34_1_cover = case_when(TR34_1_true<=TR34_1_ul & TR34_1_true>=TR34_1_ll & is.na(TR34_1_ll)==F ~1,  
                             (TR34_1_true>TR34_1_ul | TR34_1_true<TR34_1_ll) & is.na(TR34_1_ll)==F ~0), 
    tr35_1_cover = case_when(TR35_1_true<=TR35_1_ul & TR35_1_true>=TR35_1_ll & is.na(TR35_1_ll)==F ~1,  
                             (TR35_1_true>TR35_1_ul | TR35_1_true<TR35_1_ll) & is.na(TR35_1_ll)==F ~0), 
    tr45_0_cover = case_when(TR45_0_true<=TR45_0_ul & TR45_0_true>=TR45_0_ll & is.na(TR45_0_ll)==F ~1,  
                             (TR45_0_true>TR45_0_ul | TR45_0_true<TR45_0_ll) & is.na(TR45_0_ll)==F ~0), 
    tr45_1_cover = case_when(TR45_1_true<=TR45_1_ul & TR45_1_true>=TR45_1_ll & is.na(TR45_1_ll)==F ~1,  
                             (TR45_1_true>TR45_1_ul | TR45_1_true<TR45_1_ll) & is.na(TR45_1_ll)==F ~0), 
    tr45_2_cover = case_when(TR45_2_true<=TR45_2_ul & TR45_2_true>=TR45_2_ll & is.na(TR45_2_ll)==F ~1,  
                             (TR45_2_true>TR45_2_ul | TR45_2_true<TR45_2_ll) & is.na(TR45_2_ll)==F ~0), 
    tr45_12_cover = case_when(TR45_12_true<=TR45_12_ul & TR45_12_true>=TR45_12_ll & is.na(TR45_12_ll)==F ~1,  
                              (TR45_12_true>TR45_12_ul | TR45_12_true<TR45_12_ll) & is.na(TR45_12_ll)==F ~0), 
    
    ##power

tr12_power = case_when(0<=TR12_ul & 0>=TR12_ll & TR12_true!=0 ~0, TRUE~1),
tr13_power = case_when(0<=TR13_ul & 0>=TR13_ll & TR13_true!=0 ~0, TRUE~1),
tr14_power = case_when(0<=TR14_ul & 0>=TR14_ll & TR14_true!=0 ~0, TRUE~1),
tr15_power = case_when(0<=TR15_ul & 0>=TR15_ll & TR15_true!=0 ~0, TRUE~1),

tr23_power = case_when(0<=TR23_ul & 0>=TR23_ll & TR23_true!=0 ~0, TRUE~1),
tr24_power = case_when(0<=TR24_ul & 0>=TR24_ll & TR24_true!=0 ~0, TRUE~1),
tr25_power = case_when(0<=TR25_ul & 0>=TR25_ll & TR25_true!=0 ~0, TRUE~1),

tr34_0_power = case_when(0<=TR34_0_ul & 0>=TR34_0_ll & TR34_0_true!=0 ~0, TRUE~1),
tr34_1_power = case_when(0<=TR34_1_ul & 0>=TR34_1_ll & TR34_1_true!=0 ~0, TRUE~1),
tr35_0_power = case_when(0<=TR35_0_ul & 0>=TR35_0_ll & TR35_0_true!=0 ~0, TRUE~1),
tr35_1_power = case_when(0<=TR35_1_ul & 0>=TR35_1_ll & TR35_1_true!=0 ~0, TRUE~1),

tr45_0_power = case_when(0<=TR45_0_ul & 0>=TR45_0_ll & TR45_0_true!=0 ~0, TRUE~1),
tr45_1_power = case_when(0<=TR45_1_ul & 0>=TR45_1_ll & TR45_1_true!=0 ~0, TRUE~1),
tr45_2_power = case_when(0<=TR45_2_ul & 0>=TR45_2_ll & TR45_2_true!=0 ~0, TRUE~1),
tr45_12_power = case_when(0<=TR45_12_ul & 0>=TR45_12_ll & TR45_12_true!=0 ~0, TRUE~1),


    tr_b = rowMeans(across(c(tr12_b, tr13_b, tr14_b, tr15_b, tr23_b, 
                             tr24_b, tr25_b, tr34_0_b, tr35_0_b,tr34_1_b, tr35_1_b, 
                             tr45_0_b,tr45_1_b,tr45_2_b,tr45_12_b)), na.rm=T),
    
    tr_mes = rowMeans(across(c(tr12_mes, tr13_mes, tr14_mes, tr15_mes, tr23_mes, 
                               tr24_mes, tr25_mes, tr34_0_mes, tr35_0_mes,tr34_1_mes, tr35_1_mes, 
                               tr45_0_mes,tr45_1_mes,tr45_2_mes,tr45_12_mes)), na.rm=T),
    
    tr_cover = rowMeans(across(c(tr12_cover, tr13_cover, tr14_cover, tr15_cover, tr23_cover, 
                                 tr24_cover, tr25_cover, tr34_0_cover, tr35_0_cover,tr34_1_cover, tr35_1_cover, 
                                 tr45_0_cover,tr45_1_cover,tr45_2_cover,tr45_12_cover)), na.rm=T),

tr_power = rowMeans(across(c(tr12_power, tr13_power, tr14_power, tr15_power, tr23_power, 
                             tr24_power, tr25_power, tr34_0_power, tr35_0_power,tr34_1_power, tr35_1_power, 
                             tr45_0_power,tr45_1_power,tr45_2_power,tr45_12_power)), na.rm=T)

    
  )

markov_width_t3=mean(c(width_markov_t3$tr_b), na.rm=T)
markov_mes_t3=mean(c(width_markov_t3$tr_mes), na.rm=T)
markov_coverage_t3=mean(c(width_markov_t3$tr_cover), na.rm=T)
markov_power_t3=mean(c(width_markov_t3$tr_power), na.rm=T)


width_markov_t4 <-width_markov_t4 %>%
  mutate(
    
    ##width
    
    
    
    tr12_b=(TR12_ul-TR12_ll),
    tr13_b=(TR13_ul-TR13_ll),
    tr14_b=(TR14_ul-TR14_ll),
    tr15_b=(TR15_ul-TR15_ll),
    
    tr23_b=(TR23_ul-TR23_ll),
    tr24_b=(TR24_ul-TR24_ll),
    tr25_b=(TR25_ul-TR25_ll),
    
    tr34_0_b=(TR34_0_ul-TR34_0_ll),
    tr35_0_b=(TR35_0_ul-TR35_0_ll),
    
    tr34_1_b=(TR34_1_ul-TR34_1_ll),
    tr35_1_b=(TR35_1_ul-TR35_1_ll),
    
    tr45_0_b=(TR45_0_ul-TR45_0_ll),
    tr45_1_b=(TR45_1_ul-TR45_1_ll),
    tr45_2_b=(TR45_2_ul-TR45_2_ll),
    tr45_12_b=(TR45_12_ul-TR45_12_ll),
    
    
    ##mse
    
    tr12_mes=(TR12_true-TR12)^2,
    tr13_mes=(TR13_true-TR13)^2,
    tr14_mes=(TR14_true-TR14)^2,
    tr15_mes=(TR15_true-TR15)^2,
    
    tr23_mes=(TR23_true-TR23)^2,
    tr24_mes=(TR24_true-TR24)^2,
    tr25_mes=(TR25_true-TR25)^2,
    
    tr34_0_mes=(TR34_0_true-TR34_0)^2,
    tr35_0_mes=(TR35_0_true-TR35_0)^2,
    
    tr34_1_mes=(TR34_1_true-TR34_1)^2,
    tr35_1_mes=(TR35_1_true-TR35_1)^2,
    
    tr45_0_mes=(TR45_0_true-TR45_0)^2,
    tr45_1_mes=(TR45_1_true-TR45_1)^2,
    tr45_2_mes=(TR45_2_true-TR45_2)^2,
    tr45_12_mes=(TR45_12_true-TR45_12)^2,
    
    
    ##coverage
    
    tr12_cover = case_when(TR12_true<=TR12_ul & TR12_true>=TR12_ll & is.na(TR12_ll)==F ~1,  
                           (TR12_true>TR12_ul | TR12_true<TR12_ll) & is.na(TR12_ll)==F ~0),   
    tr13_cover = case_when(TR13_true<=TR13_ul & TR13_true>=TR13_ll & is.na(TR13_ll)==F ~1,  
                           (TR13_true>TR13_ul | TR13_true<TR13_ll) & is.na(TR13_ll)==F ~0), 
    tr14_cover = case_when(TR14_true<=TR14_ul & TR14_true>=TR14_ll & is.na(TR14_ll)==F ~1,  
                           (TR14_true>TR14_ul | TR14_true<TR14_ll) & is.na(TR14_ll)==F ~0), 
    tr15_cover = case_when(TR15_true<=TR15_ul & TR15_true>=TR15_ll & is.na(TR15_ll)==F ~1,  
                           (TR15_true>TR15_ul | TR15_true<TR15_ll) & is.na(TR15_ll)==F ~0), 
    tr23_cover = case_when(TR23_true<=TR23_ul & TR23_true>=TR23_ll & is.na(TR23_ll)==F ~1,  
                           (TR23_true>TR23_ul | TR23_true<TR23_ll) & is.na(TR23_ll)==F ~0), 
    tr24_cover = case_when(TR24_true<=TR24_ul & TR24_true>=TR24_ll & is.na(TR24_ll)==F ~1,  
                           (TR24_true>TR24_ul | TR24_true<TR24_ll) & is.na(TR24_ll)==F ~0), 
    tr25_cover = case_when(TR25_true<=TR25_ul & TR25_true>=TR25_ll & is.na(TR25_ll)==F ~1,  
                           (TR25_true>TR25_ul | TR25_true<TR25_ll) & is.na(TR25_ll)==F ~0), 
    tr34_0_cover = case_when(TR34_0_true<=TR34_0_ul & TR34_0_true>=TR34_0_ll & is.na(TR34_0_ll)==F ~1,  
                             (TR34_0_true>TR34_0_ul | TR34_0_true<TR34_0_ll) & is.na(TR34_0_ll)==F ~0), 
    tr35_0_cover = case_when(TR35_0_true<=TR35_0_ul & TR35_0_true>=TR35_0_ll & is.na(TR35_0_ll)==F ~1,  
                             (TR35_0_true>TR35_0_ul | TR35_0_true<TR35_0_ll) & is.na(TR35_0_ll)==F ~0), 
    tr34_1_cover = case_when(TR34_1_true<=TR34_1_ul & TR34_1_true>=TR34_1_ll & is.na(TR34_1_ll)==F ~1,  
                             (TR34_1_true>TR34_1_ul | TR34_1_true<TR34_1_ll) & is.na(TR34_1_ll)==F ~0), 
    tr35_1_cover = case_when(TR35_1_true<=TR35_1_ul & TR35_1_true>=TR35_1_ll & is.na(TR35_1_ll)==F ~1,  
                             (TR35_1_true>TR35_1_ul | TR35_1_true<TR35_1_ll) & is.na(TR35_1_ll)==F ~0), 
    tr45_0_cover = case_when(TR45_0_true<=TR45_0_ul & TR45_0_true>=TR45_0_ll & is.na(TR45_0_ll)==F ~1,  
                             (TR45_0_true>TR45_0_ul | TR45_0_true<TR45_0_ll) & is.na(TR45_0_ll)==F ~0), 
    tr45_1_cover = case_when(TR45_1_true<=TR45_1_ul & TR45_1_true>=TR45_1_ll & is.na(TR45_1_ll)==F ~1,  
                             (TR45_1_true>TR45_1_ul | TR45_1_true<TR45_1_ll) & is.na(TR45_1_ll)==F ~0), 
    tr45_2_cover = case_when(TR45_2_true<=TR45_2_ul & TR45_2_true>=TR45_2_ll & is.na(TR45_2_ll)==F ~1,  
                             (TR45_2_true>TR45_2_ul | TR45_2_true<TR45_2_ll) & is.na(TR45_2_ll)==F ~0), 
    tr45_12_cover = case_when(TR45_12_true<=TR45_12_ul & TR45_12_true>=TR45_12_ll & is.na(TR45_12_ll)==F ~1,  
                              (TR45_12_true>TR45_12_ul | TR45_12_true<TR45_12_ll) & is.na(TR45_12_ll)==F ~0), 

##power

tr12_power = case_when(0<=TR12_ul & 0>=TR12_ll & TR12_true!=0 ~0, TRUE~1),
tr13_power = case_when(0<=TR13_ul & 0>=TR13_ll & TR13_true!=0 ~0, TRUE~1),
tr14_power = case_when(0<=TR14_ul & 0>=TR14_ll & TR14_true!=0 ~0, TRUE~1),
tr15_power = case_when(0<=TR15_ul & 0>=TR15_ll & TR15_true!=0 ~0, TRUE~1),

tr23_power = case_when(0<=TR23_ul & 0>=TR23_ll & TR23_true!=0 ~0, TRUE~1),
tr24_power = case_when(0<=TR24_ul & 0>=TR24_ll & TR24_true!=0 ~0, TRUE~1),
tr25_power = case_when(0<=TR25_ul & 0>=TR25_ll & TR25_true!=0 ~0, TRUE~1),

tr34_0_power = case_when(0<=TR34_0_ul & 0>=TR34_0_ll & TR34_0_true!=0 ~0, TRUE~1),
tr34_1_power = case_when(0<=TR34_1_ul & 0>=TR34_1_ll & TR34_1_true!=0 ~0, TRUE~1),
tr35_0_power = case_when(0<=TR35_0_ul & 0>=TR35_0_ll & TR35_0_true!=0 ~0, TRUE~1),
tr35_1_power = case_when(0<=TR35_1_ul & 0>=TR35_1_ll & TR35_1_true!=0 ~0, TRUE~1),

tr45_0_power = case_when(0<=TR45_0_ul & 0>=TR45_0_ll & TR45_0_true!=0 ~0, TRUE~1),
tr45_1_power = case_when(0<=TR45_1_ul & 0>=TR45_1_ll & TR45_1_true!=0 ~0, TRUE~1),
tr45_2_power = case_when(0<=TR45_2_ul & 0>=TR45_2_ll & TR45_2_true!=0 ~0, TRUE~1),
tr45_12_power = case_when(0<=TR45_12_ul & 0>=TR45_12_ll & TR45_12_true!=0 ~0, TRUE~1),

    tr_b = rowMeans(across(c(tr12_b, tr13_b, tr14_b, tr15_b, tr23_b, 
                             tr24_b, tr25_b, tr34_0_b, tr35_0_b,tr34_1_b, tr35_1_b, 
                             tr45_0_b,tr45_1_b,tr45_2_b,tr45_12_b)), na.rm=T),
    
    tr_mes = rowMeans(across(c(tr12_mes, tr13_mes, tr14_mes, tr15_mes, tr23_mes, 
                               tr24_mes, tr25_mes, tr34_0_mes, tr35_0_mes,tr34_1_mes, tr35_1_mes, 
                               tr45_0_mes,tr45_1_mes,tr45_2_mes,tr45_12_mes)), na.rm=T),
    
    tr_cover = rowMeans(across(c(tr12_cover, tr13_cover, tr14_cover, tr15_cover, tr23_cover, 
                                 tr24_cover, tr25_cover, tr34_0_cover, tr35_0_cover,tr34_1_cover, tr35_1_cover, 
                                 tr45_0_cover,tr45_1_cover,tr45_2_cover,tr45_12_cover)), na.rm=T),

tr_power = rowMeans(across(c(tr12_power, tr13_power, tr14_power, tr15_power, tr23_power, 
                             tr24_power, tr25_power, tr34_0_power, tr35_0_power,tr34_1_power, tr35_1_power, 
                             tr45_0_power,tr45_1_power,tr45_2_power,tr45_12_power)), na.rm=T)

    
  )

markov_width_t4=mean(c(width_markov_t4$tr_b), na.rm=T)
markov_mes_t4=mean(c(width_markov_t4$tr_mes), na.rm=T)
markov_coverage_t4=mean(c(width_markov_t4$tr_cover), na.rm=T)
markov_power_t4=mean(c(width_markov_t4$tr_power), na.rm=T)


width_markov_t5 <-width_markov_t5 %>%
  mutate(
    
    ##width
    
    
    
    tr12_b=(TR12_ul-TR12_ll),
    tr13_b=(TR13_ul-TR13_ll),
    tr14_b=(TR14_ul-TR14_ll),
    tr15_b=(TR15_ul-TR15_ll),
    
    tr23_b=(TR23_ul-TR23_ll),
    tr24_b=(TR24_ul-TR24_ll),
    tr25_b=(TR25_ul-TR25_ll),
    
    tr34_0_b=(TR34_0_ul-TR34_0_ll),
    tr35_0_b=(TR35_0_ul-TR35_0_ll),
    
    tr34_1_b=(TR34_1_ul-TR34_1_ll),
    tr35_1_b=(TR35_1_ul-TR35_1_ll),
    
    tr45_0_b=(TR45_0_ul-TR45_0_ll),
    tr45_1_b=(TR45_1_ul-TR45_1_ll),
    tr45_2_b=(TR45_2_ul-TR45_2_ll),
    tr45_12_b=(TR45_12_ul-TR45_12_ll),
    
    
    ##mse
    
    tr12_mes=(TR12_true-TR12)^2,
    tr13_mes=(TR13_true-TR13)^2,
    tr14_mes=(TR14_true-TR14)^2,
    tr15_mes=(TR15_true-TR15)^2,
    
    tr23_mes=(TR23_true-TR23)^2,
    tr24_mes=(TR24_true-TR24)^2,
    tr25_mes=(TR25_true-TR25)^2,
    
    tr34_0_mes=(TR34_0_true-TR34_0)^2,
    tr35_0_mes=(TR35_0_true-TR35_0)^2,
    
    tr34_1_mes=(TR34_1_true-TR34_1)^2,
    tr35_1_mes=(TR35_1_true-TR35_1)^2,
    
    tr45_0_mes=(TR45_0_true-TR45_0)^2,
    tr45_1_mes=(TR45_1_true-TR45_1)^2,
    tr45_2_mes=(TR45_2_true-TR45_2)^2,
    tr45_12_mes=(TR45_12_true-TR45_12)^2,
    
    
    ##coverage
    
    tr12_cover = case_when(TR12_true<=TR12_ul & TR12_true>=TR12_ll & is.na(TR12_ll)==F ~1,  
                           (TR12_true>TR12_ul | TR12_true<TR12_ll) & is.na(TR12_ll)==F ~0),   
    tr13_cover = case_when(TR13_true<=TR13_ul & TR13_true>=TR13_ll & is.na(TR13_ll)==F ~1,  
                           (TR13_true>TR13_ul | TR13_true<TR13_ll) & is.na(TR13_ll)==F ~0), 
    tr14_cover = case_when(TR14_true<=TR14_ul & TR14_true>=TR14_ll & is.na(TR14_ll)==F ~1,  
                           (TR14_true>TR14_ul | TR14_true<TR14_ll) & is.na(TR14_ll)==F ~0), 
    tr15_cover = case_when(TR15_true<=TR15_ul & TR15_true>=TR15_ll & is.na(TR15_ll)==F ~1,  
                           (TR15_true>TR15_ul | TR15_true<TR15_ll) & is.na(TR15_ll)==F ~0), 
    tr23_cover = case_when(TR23_true<=TR23_ul & TR23_true>=TR23_ll & is.na(TR23_ll)==F ~1,  
                           (TR23_true>TR23_ul | TR23_true<TR23_ll) & is.na(TR23_ll)==F ~0), 
    tr24_cover = case_when(TR24_true<=TR24_ul & TR24_true>=TR24_ll & is.na(TR24_ll)==F ~1,  
                           (TR24_true>TR24_ul | TR24_true<TR24_ll) & is.na(TR24_ll)==F ~0), 
    tr25_cover = case_when(TR25_true<=TR25_ul & TR25_true>=TR25_ll & is.na(TR25_ll)==F ~1,  
                           (TR25_true>TR25_ul | TR25_true<TR25_ll) & is.na(TR25_ll)==F ~0), 
    tr34_0_cover = case_when(TR34_0_true<=TR34_0_ul & TR34_0_true>=TR34_0_ll & is.na(TR34_0_ll)==F ~1,  
                             (TR34_0_true>TR34_0_ul | TR34_0_true<TR34_0_ll) & is.na(TR34_0_ll)==F ~0), 
    tr35_0_cover = case_when(TR35_0_true<=TR35_0_ul & TR35_0_true>=TR35_0_ll & is.na(TR35_0_ll)==F ~1,  
                             (TR35_0_true>TR35_0_ul | TR35_0_true<TR35_0_ll) & is.na(TR35_0_ll)==F ~0), 
    tr34_1_cover = case_when(TR34_1_true<=TR34_1_ul & TR34_1_true>=TR34_1_ll & is.na(TR34_1_ll)==F ~1,  
                             (TR34_1_true>TR34_1_ul | TR34_1_true<TR34_1_ll) & is.na(TR34_1_ll)==F ~0), 
    tr35_1_cover = case_when(TR35_1_true<=TR35_1_ul & TR35_1_true>=TR35_1_ll & is.na(TR35_1_ll)==F ~1,  
                             (TR35_1_true>TR35_1_ul | TR35_1_true<TR35_1_ll) & is.na(TR35_1_ll)==F ~0), 
    tr45_0_cover = case_when(TR45_0_true<=TR45_0_ul & TR45_0_true>=TR45_0_ll & is.na(TR45_0_ll)==F ~1,  
                             (TR45_0_true>TR45_0_ul | TR45_0_true<TR45_0_ll) & is.na(TR45_0_ll)==F ~0), 
    tr45_1_cover = case_when(TR45_1_true<=TR45_1_ul & TR45_1_true>=TR45_1_ll & is.na(TR45_1_ll)==F ~1,  
                             (TR45_1_true>TR45_1_ul | TR45_1_true<TR45_1_ll) & is.na(TR45_1_ll)==F ~0), 
    tr45_2_cover = case_when(TR45_2_true<=TR45_2_ul & TR45_2_true>=TR45_2_ll & is.na(TR45_2_ll)==F ~1,  
                             (TR45_2_true>TR45_2_ul | TR45_2_true<TR45_2_ll) & is.na(TR45_2_ll)==F ~0), 
    tr45_12_cover = case_when(TR45_12_true<=TR45_12_ul & TR45_12_true>=TR45_12_ll & is.na(TR45_12_ll)==F ~1,  
                              (TR45_12_true>TR45_12_ul | TR45_12_true<TR45_12_ll) & is.na(TR45_12_ll)==F ~0), 
    
    ##power

tr12_power = case_when(0<=TR12_ul & 0>=TR12_ll & TR12_true!=0 ~0, TRUE~1),
tr13_power = case_when(0<=TR13_ul & 0>=TR13_ll & TR13_true!=0 ~0, TRUE~1),
tr14_power = case_when(0<=TR14_ul & 0>=TR14_ll & TR14_true!=0 ~0, TRUE~1),
tr15_power = case_when(0<=TR15_ul & 0>=TR15_ll & TR15_true!=0 ~0, TRUE~1),

tr23_power = case_when(0<=TR23_ul & 0>=TR23_ll & TR23_true!=0 ~0, TRUE~1),
tr24_power = case_when(0<=TR24_ul & 0>=TR24_ll & TR24_true!=0 ~0, TRUE~1),
tr25_power = case_when(0<=TR25_ul & 0>=TR25_ll & TR25_true!=0 ~0, TRUE~1),

tr34_0_power = case_when(0<=TR34_0_ul & 0>=TR34_0_ll & TR34_0_true!=0 ~0, TRUE~1),
tr34_1_power = case_when(0<=TR34_1_ul & 0>=TR34_1_ll & TR34_1_true!=0 ~0, TRUE~1),
tr35_0_power = case_when(0<=TR35_0_ul & 0>=TR35_0_ll & TR35_0_true!=0 ~0, TRUE~1),
tr35_1_power = case_when(0<=TR35_1_ul & 0>=TR35_1_ll & TR35_1_true!=0 ~0, TRUE~1),

tr45_0_power = case_when(0<=TR45_0_ul & 0>=TR45_0_ll & TR45_0_true!=0 ~0, TRUE~1),
tr45_1_power = case_when(0<=TR45_1_ul & 0>=TR45_1_ll & TR45_1_true!=0 ~0, TRUE~1),
tr45_2_power = case_when(0<=TR45_2_ul & 0>=TR45_2_ll & TR45_2_true!=0 ~0, TRUE~1),
tr45_12_power = case_when(0<=TR45_12_ul & 0>=TR45_12_ll & TR45_12_true!=0 ~0, TRUE~1),

    
    tr_b = rowMeans(across(c(tr12_b, tr13_b, tr14_b, tr15_b, tr23_b, 
                             tr24_b, tr25_b, tr34_0_b, tr35_0_b,tr34_1_b, tr35_1_b, 
                             tr45_0_b,tr45_1_b,tr45_2_b,tr45_12_b)), na.rm=T),
    
    tr_mes = rowMeans(across(c(tr12_mes, tr13_mes, tr14_mes, tr15_mes, tr23_mes, 
                               tr24_mes, tr25_mes, tr34_0_mes, tr35_0_mes,tr34_1_mes, tr35_1_mes, 
                               tr45_0_mes,tr45_1_mes,tr45_2_mes,tr45_12_mes)), na.rm=T),
    
    tr_cover = rowMeans(across(c(tr12_cover, tr13_cover, tr14_cover, tr15_cover, tr23_cover, 
                                 tr24_cover, tr25_cover, tr34_0_cover, tr35_0_cover,tr34_1_cover, tr35_1_cover, 
                                 tr45_0_cover,tr45_1_cover,tr45_2_cover,tr45_12_cover)), na.rm=T),

tr_power = rowMeans(across(c(tr12_power, tr13_power, tr14_power, tr15_power, tr23_power, 
                             tr24_power, tr25_power, tr34_0_power, tr35_0_power,tr34_1_power, tr35_1_power, 
                             tr45_0_power,tr45_1_power,tr45_2_power,tr45_12_power)), na.rm=T)

    
  )


markov_width_t5=mean(c(width_markov_t5$tr_b), na.rm=T)
markov_mes_t5=mean(c(width_markov_t5$tr_mes), na.rm=T)
markov_coverage_t5=mean(c(width_markov_t5$tr_cover), na.rm=T)
markov_power_t5=mean(c(width_markov_t5$tr_power), na.rm=T)




##non markov


width_nonmarkov_t1 <-width_nonmarkov_t1 %>%
  mutate(
    
    ##width
    
    
    tr12_b=(TR12_ul-TR12_ll),
    tr13_b=(TR13_ul-TR13_ll),
    tr14_b=(TR14_ul-TR14_ll),
    tr15_b=(TR15_ul-TR15_ll),
    
    tr23_b=(TR23_ul-TR23_ll),
    tr24_b=(TR24_ul-TR24_ll),
    tr25_b=(TR25_ul-TR25_ll),
    
    tr34_0_b=(TR34_0_ul-TR34_0_ll),
    tr35_0_b=(TR35_0_ul-TR35_0_ll),
    
    tr34_1_b=(TR34_1_ul-TR34_1_ll),
    tr35_1_b=(TR35_1_ul-TR35_1_ll),
    
    tr45_0_b=(TR45_0_ul-TR45_0_ll),
    tr45_1_b=(TR45_1_ul-TR45_1_ll),
    tr45_2_b=(TR45_2_ul-TR45_2_ll),
    tr45_12_b=(TR45_12_ul-TR45_12_ll),
    
    
    ##mse
    
    tr12_mes=(TR12_true-TR12)^2,
    tr13_mes=(TR13_true-TR13)^2,
    tr14_mes=(TR14_true-TR14)^2,
    tr15_mes=(TR15_true-TR15)^2,
    
    tr23_mes=(TR23_true-TR23)^2,
    tr24_mes=(TR24_true-TR24)^2,
    tr25_mes=(TR25_true-TR25)^2,
    
    tr34_0_mes=(TR34_0_true-TR34_0)^2,
    tr35_0_mes=(TR35_0_true-TR35_0)^2,
    
    tr34_1_mes=(TR34_1_true-TR34_1)^2,
    tr35_1_mes=(TR35_1_true-TR35_1)^2,
    
    tr45_0_mes=(TR45_0_true-TR45_0)^2,
    tr45_1_mes=(TR45_1_true-TR45_1)^2,
    tr45_2_mes=(TR45_2_true-TR45_2)^2,
    tr45_12_mes=(TR45_12_true-TR45_12)^2,
    
    
    ##coverage
    
    tr12_cover = case_when(TR12_true<=TR12_ul & TR12_true>=TR12_ll & is.na(TR12_ll)==F ~1,  
                           (TR12_true>TR12_ul | TR12_true<TR12_ll) & is.na(TR12_ll)==F ~0),   
    tr13_cover = case_when(TR13_true<=TR13_ul & TR13_true>=TR13_ll & is.na(TR13_ll)==F ~1,  
                           (TR13_true>TR13_ul | TR13_true<TR13_ll) & is.na(TR13_ll)==F ~0), 
    tr14_cover = case_when(TR14_true<=TR14_ul & TR14_true>=TR14_ll & is.na(TR14_ll)==F ~1,  
                           (TR14_true>TR14_ul | TR14_true<TR14_ll) & is.na(TR14_ll)==F ~0), 
    tr15_cover = case_when(TR15_true<=TR15_ul & TR15_true>=TR15_ll & is.na(TR15_ll)==F ~1,  
                           (TR15_true>TR15_ul | TR15_true<TR15_ll) & is.na(TR15_ll)==F ~0), 
    tr23_cover = case_when(TR23_true<=TR23_ul & TR23_true>=TR23_ll & is.na(TR23_ll)==F ~1,  
                           (TR23_true>TR23_ul | TR23_true<TR23_ll) & is.na(TR23_ll)==F ~0), 
    tr24_cover = case_when(TR24_true<=TR24_ul & TR24_true>=TR24_ll & is.na(TR24_ll)==F ~1,  
                           (TR24_true>TR24_ul | TR24_true<TR24_ll) & is.na(TR24_ll)==F ~0), 
    tr25_cover = case_when(TR25_true<=TR25_ul & TR25_true>=TR25_ll & is.na(TR25_ll)==F ~1,  
                           (TR25_true>TR25_ul | TR25_true<TR25_ll) & is.na(TR25_ll)==F ~0), 
    tr34_0_cover = case_when(TR34_0_true<=TR34_0_ul & TR34_0_true>=TR34_0_ll & is.na(TR34_0_ll)==F ~1,  
                             (TR34_0_true>TR34_0_ul | TR34_0_true<TR34_0_ll) & is.na(TR34_0_ll)==F ~0), 
    tr35_0_cover = case_when(TR35_0_true<=TR35_0_ul & TR35_0_true>=TR35_0_ll & is.na(TR35_0_ll)==F ~1,  
                             (TR35_0_true>TR35_0_ul | TR35_0_true<TR35_0_ll) & is.na(TR35_0_ll)==F ~0), 
    tr34_1_cover = case_when(TR34_1_true<=TR34_1_ul & TR34_1_true>=TR34_1_ll & is.na(TR34_1_ll)==F ~1,  
                             (TR34_1_true>TR34_1_ul | TR34_1_true<TR34_1_ll) & is.na(TR34_1_ll)==F ~0), 
    tr35_1_cover = case_when(TR35_1_true<=TR35_1_ul & TR35_1_true>=TR35_1_ll & is.na(TR35_1_ll)==F ~1,  
                             (TR35_1_true>TR35_1_ul | TR35_1_true<TR35_1_ll) & is.na(TR35_1_ll)==F ~0), 
    tr45_0_cover = case_when(TR45_0_true<=TR45_0_ul & TR45_0_true>=TR45_0_ll & is.na(TR45_0_ll)==F ~1,  
                             (TR45_0_true>TR45_0_ul | TR45_0_true<TR45_0_ll) & is.na(TR45_0_ll)==F ~0), 
    tr45_1_cover = case_when(TR45_1_true<=TR45_1_ul & TR45_1_true>=TR45_1_ll & is.na(TR45_1_ll)==F ~1,  
                             (TR45_1_true>TR45_1_ul | TR45_1_true<TR45_1_ll) & is.na(TR45_1_ll)==F ~0), 
    tr45_2_cover = case_when(TR45_2_true<=TR45_2_ul & TR45_2_true>=TR45_2_ll & is.na(TR45_2_ll)==F ~1,  
                             (TR45_2_true>TR45_2_ul | TR45_2_true<TR45_2_ll) & is.na(TR45_2_ll)==F ~0), 
    tr45_12_cover = case_when(TR45_12_true<=TR45_12_ul & TR45_12_true>=TR45_12_ll & is.na(TR45_12_ll)==F ~1,  
                              (TR45_12_true>TR45_12_ul | TR45_12_true<TR45_12_ll) & is.na(TR45_12_ll)==F ~0), 
    
    
   ##power

tr12_power = case_when(0<=TR12_ul & 0>=TR12_ll & TR12_true!=0 ~0, TRUE~1),
tr13_power = case_when(0<=TR13_ul & 0>=TR13_ll & TR13_true!=0 ~0, TRUE~1),
tr14_power = case_when(0<=TR14_ul & 0>=TR14_ll & TR14_true!=0 ~0, TRUE~1),
tr15_power = case_when(0<=TR15_ul & 0>=TR15_ll & TR15_true!=0 ~0, TRUE~1),

tr23_power = case_when(0<=TR23_ul & 0>=TR23_ll & TR23_true!=0 ~0, TRUE~1),
tr24_power = case_when(0<=TR24_ul & 0>=TR24_ll & TR24_true!=0 ~0, TRUE~1),
tr25_power = case_when(0<=TR25_ul & 0>=TR25_ll & TR25_true!=0 ~0, TRUE~1),

tr34_0_power = case_when(0<=TR34_0_ul & 0>=TR34_0_ll & TR34_0_true!=0 ~0, TRUE~1),
tr34_1_power = case_when(0<=TR34_1_ul & 0>=TR34_1_ll & TR34_1_true!=0 ~0, TRUE~1),
tr35_0_power = case_when(0<=TR35_0_ul & 0>=TR35_0_ll & TR35_0_true!=0 ~0, TRUE~1),
tr35_1_power = case_when(0<=TR35_1_ul & 0>=TR35_1_ll & TR35_1_true!=0 ~0, TRUE~1),

tr45_0_power = case_when(0<=TR45_0_ul & 0>=TR45_0_ll & TR45_0_true!=0 ~0, TRUE~1),
tr45_1_power = case_when(0<=TR45_1_ul & 0>=TR45_1_ll & TR45_1_true!=0 ~0, TRUE~1),
tr45_2_power = case_when(0<=TR45_2_ul & 0>=TR45_2_ll & TR45_2_true!=0 ~0, TRUE~1),
tr45_12_power = case_when(0<=TR45_12_ul & 0>=TR45_12_ll & TR45_12_true!=0 ~0, TRUE~1),


    tr_b = rowMeans(across(c(tr12_b, tr13_b, tr14_b, tr15_b, tr23_b, 
                             tr24_b, tr25_b, tr34_0_b, tr35_0_b,tr34_1_b, tr35_1_b, 
                             tr45_0_b,tr45_1_b,tr45_2_b,tr45_12_b)), na.rm=T),
    
    tr_mes = rowMeans(across(c(tr12_mes, tr13_mes, tr14_mes, tr15_mes, tr23_mes, 
                               tr24_mes, tr25_mes, tr34_0_mes, tr35_0_mes,tr34_1_mes, tr35_1_mes, 
                               tr45_0_mes,tr45_1_mes,tr45_2_mes,tr45_12_mes)), na.rm=T),
    
    tr_cover = rowMeans(across(c(tr12_cover, tr13_cover, tr14_cover, tr15_cover, tr23_cover, 
                                 tr24_cover, tr25_cover, tr34_0_cover, tr35_0_cover,tr34_1_cover, tr35_1_cover, 
                                 tr45_0_cover,tr45_1_cover,tr45_2_cover,tr45_12_cover)), na.rm=T),

tr_power = rowMeans(across(c(tr12_power, tr13_power, tr14_power, tr15_power, tr23_power, 
                             tr24_power, tr25_power, tr34_0_power, tr35_0_power,tr34_1_power, tr35_1_power, 
                             tr45_0_power,tr45_1_power,tr45_2_power,tr45_12_power)), na.rm=T)


    
  )

nonmarkov_width_t1=mean(c(width_nonmarkov_t1$tr_b), na.rm=T)
nonmarkov_mes_t1=mean(c(width_nonmarkov_t1$tr_mes), na.rm=T)
nonmarkov_coverage_t1=mean(c(width_nonmarkov_t1$tr_cover), na.rm=T)
nonmarkov_power_t1=mean(c(width_nonmarkov_t1$tr_power), na.rm=T)


width_nonmarkov_t2 <-width_nonmarkov_t2 %>%
  mutate(
    
    ##width
    
    tr12_b=(TR12_ul-TR12_ll),
    tr13_b=(TR13_ul-TR13_ll),
    tr14_b=(TR14_ul-TR14_ll),
    tr15_b=(TR15_ul-TR15_ll),
    
    tr23_b=(TR23_ul-TR23_ll),
    tr24_b=(TR24_ul-TR24_ll),
    tr25_b=(TR25_ul-TR25_ll),
    
    tr34_0_b=(TR34_0_ul-TR34_0_ll),
    tr35_0_b=(TR35_0_ul-TR35_0_ll),
    
    tr34_1_b=(TR34_1_ul-TR34_1_ll),
    tr35_1_b=(TR35_1_ul-TR35_1_ll),
    
    tr45_0_b=(TR45_0_ul-TR45_0_ll),
    tr45_1_b=(TR45_1_ul-TR45_1_ll),
    tr45_2_b=(TR45_2_ul-TR45_2_ll),
    tr45_12_b=(TR45_12_ul-TR45_12_ll),
    
    
    ##mse
    
    tr12_mes=(TR12_true-TR12)^2,
    tr13_mes=(TR13_true-TR13)^2,
    tr14_mes=(TR14_true-TR14)^2,
    tr15_mes=(TR15_true-TR15)^2,
    
    tr23_mes=(TR23_true-TR23)^2,
    tr24_mes=(TR24_true-TR24)^2,
    tr25_mes=(TR25_true-TR25)^2,
    
    tr34_0_mes=(TR34_0_true-TR34_0)^2,
    tr35_0_mes=(TR35_0_true-TR35_0)^2,
    
    tr34_1_mes=(TR34_1_true-TR34_1)^2,
    tr35_1_mes=(TR35_1_true-TR35_1)^2,
    
    tr45_0_mes=(TR45_0_true-TR45_0)^2,
    tr45_1_mes=(TR45_1_true-TR45_1)^2,
    tr45_2_mes=(TR45_2_true-TR45_2)^2,
    tr45_12_mes=(TR45_12_true-TR45_12)^2,
    
    
    ##coverage
    
    tr12_cover = case_when(TR12_true<=TR12_ul & TR12_true>=TR12_ll & is.na(TR12_ll)==F ~1,  
                           (TR12_true>TR12_ul | TR12_true<TR12_ll) & is.na(TR12_ll)==F ~0),   
    tr13_cover = case_when(TR13_true<=TR13_ul & TR13_true>=TR13_ll & is.na(TR13_ll)==F ~1,  
                           (TR13_true>TR13_ul | TR13_true<TR13_ll) & is.na(TR13_ll)==F ~0), 
    tr14_cover = case_when(TR14_true<=TR14_ul & TR14_true>=TR14_ll & is.na(TR14_ll)==F ~1,  
                           (TR14_true>TR14_ul | TR14_true<TR14_ll) & is.na(TR14_ll)==F ~0), 
    tr15_cover = case_when(TR15_true<=TR15_ul & TR15_true>=TR15_ll & is.na(TR15_ll)==F ~1,  
                           (TR15_true>TR15_ul | TR15_true<TR15_ll) & is.na(TR15_ll)==F ~0), 
    tr23_cover = case_when(TR23_true<=TR23_ul & TR23_true>=TR23_ll & is.na(TR23_ll)==F ~1,  
                           (TR23_true>TR23_ul | TR23_true<TR23_ll) & is.na(TR23_ll)==F ~0), 
    tr24_cover = case_when(TR24_true<=TR24_ul & TR24_true>=TR24_ll & is.na(TR24_ll)==F ~1,  
                           (TR24_true>TR24_ul | TR24_true<TR24_ll) & is.na(TR24_ll)==F ~0), 
    tr25_cover = case_when(TR25_true<=TR25_ul & TR25_true>=TR25_ll & is.na(TR25_ll)==F ~1,  
                           (TR25_true>TR25_ul | TR25_true<TR25_ll) & is.na(TR25_ll)==F ~0), 
    tr34_0_cover = case_when(TR34_0_true<=TR34_0_ul & TR34_0_true>=TR34_0_ll & is.na(TR34_0_ll)==F ~1,  
                             (TR34_0_true>TR34_0_ul | TR34_0_true<TR34_0_ll) & is.na(TR34_0_ll)==F ~0), 
    tr35_0_cover = case_when(TR35_0_true<=TR35_0_ul & TR35_0_true>=TR35_0_ll & is.na(TR35_0_ll)==F ~1,  
                             (TR35_0_true>TR35_0_ul | TR35_0_true<TR35_0_ll) & is.na(TR35_0_ll)==F ~0), 
    tr34_1_cover = case_when(TR34_1_true<=TR34_1_ul & TR34_1_true>=TR34_1_ll & is.na(TR34_1_ll)==F ~1,  
                             (TR34_1_true>TR34_1_ul | TR34_1_true<TR34_1_ll) & is.na(TR34_1_ll)==F ~0), 
    tr35_1_cover = case_when(TR35_1_true<=TR35_1_ul & TR35_1_true>=TR35_1_ll & is.na(TR35_1_ll)==F ~1,  
                             (TR35_1_true>TR35_1_ul | TR35_1_true<TR35_1_ll) & is.na(TR35_1_ll)==F ~0), 
    tr45_0_cover = case_when(TR45_0_true<=TR45_0_ul & TR45_0_true>=TR45_0_ll & is.na(TR45_0_ll)==F ~1,  
                             (TR45_0_true>TR45_0_ul | TR45_0_true<TR45_0_ll) & is.na(TR45_0_ll)==F ~0), 
    tr45_1_cover = case_when(TR45_1_true<=TR45_1_ul & TR45_1_true>=TR45_1_ll & is.na(TR45_1_ll)==F ~1,  
                             (TR45_1_true>TR45_1_ul | TR45_1_true<TR45_1_ll) & is.na(TR45_1_ll)==F ~0), 
    tr45_2_cover = case_when(TR45_2_true<=TR45_2_ul & TR45_2_true>=TR45_2_ll & is.na(TR45_2_ll)==F ~1,  
                             (TR45_2_true>TR45_2_ul | TR45_2_true<TR45_2_ll) & is.na(TR45_2_ll)==F ~0), 
    tr45_12_cover = case_when(TR45_12_true<=TR45_12_ul & TR45_12_true>=TR45_12_ll & is.na(TR45_12_ll)==F ~1,  
                              (TR45_12_true>TR45_12_ul | TR45_12_true<TR45_12_ll) & is.na(TR45_12_ll)==F ~0), 
    
 
##power

tr12_power = case_when(0<=TR12_ul & 0>=TR12_ll & TR12_true!=0 ~0, TRUE~1),
tr13_power = case_when(0<=TR13_ul & 0>=TR13_ll & TR13_true!=0 ~0, TRUE~1),
tr14_power = case_when(0<=TR14_ul & 0>=TR14_ll & TR14_true!=0 ~0, TRUE~1),
tr15_power = case_when(0<=TR15_ul & 0>=TR15_ll & TR15_true!=0 ~0, TRUE~1),

tr23_power = case_when(0<=TR23_ul & 0>=TR23_ll & TR23_true!=0 ~0, TRUE~1),
tr24_power = case_when(0<=TR24_ul & 0>=TR24_ll & TR24_true!=0 ~0, TRUE~1),
tr25_power = case_when(0<=TR25_ul & 0>=TR25_ll & TR25_true!=0 ~0, TRUE~1),

tr34_0_power = case_when(0<=TR34_0_ul & 0>=TR34_0_ll & TR34_0_true!=0 ~0, TRUE~1),
tr34_1_power = case_when(0<=TR34_1_ul & 0>=TR34_1_ll & TR34_1_true!=0 ~0, TRUE~1),
tr35_0_power = case_when(0<=TR35_0_ul & 0>=TR35_0_ll & TR35_0_true!=0 ~0, TRUE~1),
tr35_1_power = case_when(0<=TR35_1_ul & 0>=TR35_1_ll & TR35_1_true!=0 ~0, TRUE~1),

tr45_0_power = case_when(0<=TR45_0_ul & 0>=TR45_0_ll & TR45_0_true!=0 ~0, TRUE~1),
tr45_1_power = case_when(0<=TR45_1_ul & 0>=TR45_1_ll & TR45_1_true!=0 ~0, TRUE~1),
tr45_2_power = case_when(0<=TR45_2_ul & 0>=TR45_2_ll & TR45_2_true!=0 ~0, TRUE~1),
tr45_12_power = case_when(0<=TR45_12_ul & 0>=TR45_12_ll & TR45_12_true!=0 ~0, TRUE~1),


    tr_b = rowMeans(across(c(tr12_b, tr13_b, tr14_b, tr15_b, tr23_b, 
                             tr24_b, tr25_b, tr34_0_b, tr35_0_b,tr34_1_b, tr35_1_b, 
                             tr45_0_b,tr45_1_b,tr45_2_b,tr45_12_b)), na.rm=T),
    
    tr_mes = rowMeans(across(c(tr12_mes, tr13_mes, tr14_mes, tr15_mes, tr23_mes, 
                               tr24_mes, tr25_mes, tr34_0_mes, tr35_0_mes,tr34_1_mes, tr35_1_mes, 
                               tr45_0_mes,tr45_1_mes,tr45_2_mes,tr45_12_mes)), na.rm=T),
    
    tr_cover = rowMeans(across(c(tr12_cover, tr13_cover, tr14_cover, tr15_cover, tr23_cover, 
                                 tr24_cover, tr25_cover, tr34_0_cover, tr35_0_cover,tr34_1_cover, tr35_1_cover, 
                                 tr45_0_cover,tr45_1_cover,tr45_2_cover,tr45_12_cover)), na.rm=T),

tr_power = rowMeans(across(c(tr12_power, tr13_power, tr14_power, tr15_power, tr23_power, 
                             tr24_power, tr25_power, tr34_0_power, tr35_0_power,tr34_1_power, tr35_1_power, 
                             tr45_0_power,tr45_1_power,tr45_2_power,tr45_12_power)), na.rm=T)

    
  )

nonmarkov_width_t2=mean(c(width_nonmarkov_t2$tr_b), na.rm=T)
nonmarkov_mes_t2=mean(c(width_nonmarkov_t2$tr_mes), na.rm=T)
nonmarkov_coverage_t2=mean(c(width_nonmarkov_t2$tr_cover), na.rm=T)
nonmarkov_power_t2=mean(c(width_nonmarkov_t2$tr_power), na.rm=T)


width_nonmarkov_t3 <-width_nonmarkov_t3 %>%
  mutate(
    
    ##width
    
    tr12_b=(TR12_ul-TR12_ll),
    tr13_b=(TR13_ul-TR13_ll),
    tr14_b=(TR14_ul-TR14_ll),
    tr15_b=(TR15_ul-TR15_ll),
    
    tr23_b=(TR23_ul-TR23_ll),
    tr24_b=(TR24_ul-TR24_ll),
    tr25_b=(TR25_ul-TR25_ll),
    
    tr34_0_b=(TR34_0_ul-TR34_0_ll),
    tr35_0_b=(TR35_0_ul-TR35_0_ll),
    
    tr34_1_b=(TR34_1_ul-TR34_1_ll),
    tr35_1_b=(TR35_1_ul-TR35_1_ll),
    
    tr45_0_b=(TR45_0_ul-TR45_0_ll),
    tr45_1_b=(TR45_1_ul-TR45_1_ll),
    tr45_2_b=(TR45_2_ul-TR45_2_ll),
    tr45_12_b=(TR45_12_ul-TR45_12_ll),
    
    
    ##mse
    
    tr12_mes=(TR12_true-TR12)^2,
    tr13_mes=(TR13_true-TR13)^2,
    tr14_mes=(TR14_true-TR14)^2,
    tr15_mes=(TR15_true-TR15)^2,
    
    tr23_mes=(TR23_true-TR23)^2,
    tr24_mes=(TR24_true-TR24)^2,
    tr25_mes=(TR25_true-TR25)^2,
    
    tr34_0_mes=(TR34_0_true-TR34_0)^2,
    tr35_0_mes=(TR35_0_true-TR35_0)^2,
    
    tr34_1_mes=(TR34_1_true-TR34_1)^2,
    tr35_1_mes=(TR35_1_true-TR35_1)^2,
    
    tr45_0_mes=(TR45_0_true-TR45_0)^2,
    tr45_1_mes=(TR45_1_true-TR45_1)^2,
    tr45_2_mes=(TR45_2_true-TR45_2)^2,
    tr45_12_mes=(TR45_12_true-TR45_12)^2,
    
    
    ##coverage
    
    tr12_cover = case_when(TR12_true<=TR12_ul & TR12_true>=TR12_ll & is.na(TR12_ll)==F ~1,  
                           (TR12_true>TR12_ul | TR12_true<TR12_ll) & is.na(TR12_ll)==F ~0),   
    tr13_cover = case_when(TR13_true<=TR13_ul & TR13_true>=TR13_ll & is.na(TR13_ll)==F ~1,  
                           (TR13_true>TR13_ul | TR13_true<TR13_ll) & is.na(TR13_ll)==F ~0), 
    tr14_cover = case_when(TR14_true<=TR14_ul & TR14_true>=TR14_ll & is.na(TR14_ll)==F ~1,  
                           (TR14_true>TR14_ul | TR14_true<TR14_ll) & is.na(TR14_ll)==F ~0), 
    tr15_cover = case_when(TR15_true<=TR15_ul & TR15_true>=TR15_ll & is.na(TR15_ll)==F ~1,  
                           (TR15_true>TR15_ul | TR15_true<TR15_ll) & is.na(TR15_ll)==F ~0), 
    tr23_cover = case_when(TR23_true<=TR23_ul & TR23_true>=TR23_ll & is.na(TR23_ll)==F ~1,  
                           (TR23_true>TR23_ul | TR23_true<TR23_ll) & is.na(TR23_ll)==F ~0), 
    tr24_cover = case_when(TR24_true<=TR24_ul & TR24_true>=TR24_ll & is.na(TR24_ll)==F ~1,  
                           (TR24_true>TR24_ul | TR24_true<TR24_ll) & is.na(TR24_ll)==F ~0), 
    tr25_cover = case_when(TR25_true<=TR25_ul & TR25_true>=TR25_ll & is.na(TR25_ll)==F ~1,  
                           (TR25_true>TR25_ul | TR25_true<TR25_ll) & is.na(TR25_ll)==F ~0), 
    tr34_0_cover = case_when(TR34_0_true<=TR34_0_ul & TR34_0_true>=TR34_0_ll & is.na(TR34_0_ll)==F ~1,  
                             (TR34_0_true>TR34_0_ul | TR34_0_true<TR34_0_ll) & is.na(TR34_0_ll)==F ~0), 
    tr35_0_cover = case_when(TR35_0_true<=TR35_0_ul & TR35_0_true>=TR35_0_ll & is.na(TR35_0_ll)==F ~1,  
                             (TR35_0_true>TR35_0_ul | TR35_0_true<TR35_0_ll) & is.na(TR35_0_ll)==F ~0), 
    tr34_1_cover = case_when(TR34_1_true<=TR34_1_ul & TR34_1_true>=TR34_1_ll & is.na(TR34_1_ll)==F ~1,  
                             (TR34_1_true>TR34_1_ul | TR34_1_true<TR34_1_ll) & is.na(TR34_1_ll)==F ~0), 
    tr35_1_cover = case_when(TR35_1_true<=TR35_1_ul & TR35_1_true>=TR35_1_ll & is.na(TR35_1_ll)==F ~1,  
                             (TR35_1_true>TR35_1_ul | TR35_1_true<TR35_1_ll) & is.na(TR35_1_ll)==F ~0), 
    tr45_0_cover = case_when(TR45_0_true<=TR45_0_ul & TR45_0_true>=TR45_0_ll & is.na(TR45_0_ll)==F ~1,  
                             (TR45_0_true>TR45_0_ul | TR45_0_true<TR45_0_ll) & is.na(TR45_0_ll)==F ~0), 
    tr45_1_cover = case_when(TR45_1_true<=TR45_1_ul & TR45_1_true>=TR45_1_ll & is.na(TR45_1_ll)==F ~1,  
                             (TR45_1_true>TR45_1_ul | TR45_1_true<TR45_1_ll) & is.na(TR45_1_ll)==F ~0), 
    tr45_2_cover = case_when(TR45_2_true<=TR45_2_ul & TR45_2_true>=TR45_2_ll & is.na(TR45_2_ll)==F ~1,  
                             (TR45_2_true>TR45_2_ul | TR45_2_true<TR45_2_ll) & is.na(TR45_2_ll)==F ~0), 
    tr45_12_cover = case_when(TR45_12_true<=TR45_12_ul & TR45_12_true>=TR45_12_ll & is.na(TR45_12_ll)==F ~1,  
                              (TR45_12_true>TR45_12_ul | TR45_12_true<TR45_12_ll) & is.na(TR45_12_ll)==F ~0), 
    
   
##power

tr12_power = case_when(0<=TR12_ul & 0>=TR12_ll & TR12_true!=0 ~0, TRUE~1),
tr13_power = case_when(0<=TR13_ul & 0>=TR13_ll & TR13_true!=0 ~0, TRUE~1),
tr14_power = case_when(0<=TR14_ul & 0>=TR14_ll & TR14_true!=0 ~0, TRUE~1),
tr15_power = case_when(0<=TR15_ul & 0>=TR15_ll & TR15_true!=0 ~0, TRUE~1),

tr23_power = case_when(0<=TR23_ul & 0>=TR23_ll & TR23_true!=0 ~0, TRUE~1),
tr24_power = case_when(0<=TR24_ul & 0>=TR24_ll & TR24_true!=0 ~0, TRUE~1),
tr25_power = case_when(0<=TR25_ul & 0>=TR25_ll & TR25_true!=0 ~0, TRUE~1),

tr34_0_power = case_when(0<=TR34_0_ul & 0>=TR34_0_ll & TR34_0_true!=0 ~0, TRUE~1),
tr34_1_power = case_when(0<=TR34_1_ul & 0>=TR34_1_ll & TR34_1_true!=0 ~0, TRUE~1),
tr35_0_power = case_when(0<=TR35_0_ul & 0>=TR35_0_ll & TR35_0_true!=0 ~0, TRUE~1),
tr35_1_power = case_when(0<=TR35_1_ul & 0>=TR35_1_ll & TR35_1_true!=0 ~0, TRUE~1),

tr45_0_power = case_when(0<=TR45_0_ul & 0>=TR45_0_ll & TR45_0_true!=0 ~0, TRUE~1),
tr45_1_power = case_when(0<=TR45_1_ul & 0>=TR45_1_ll & TR45_1_true!=0 ~0, TRUE~1),
tr45_2_power = case_when(0<=TR45_2_ul & 0>=TR45_2_ll & TR45_2_true!=0 ~0, TRUE~1),
tr45_12_power = case_when(0<=TR45_12_ul & 0>=TR45_12_ll & TR45_12_true!=0 ~0, TRUE~1),


    tr_b = rowMeans(across(c(tr12_b, tr13_b, tr14_b, tr15_b, tr23_b, 
                             tr24_b, tr25_b, tr34_0_b, tr35_0_b,tr34_1_b, tr35_1_b, 
                             tr45_0_b,tr45_1_b,tr45_2_b,tr45_12_b)), na.rm=T),
    
    tr_mes = rowMeans(across(c(tr12_mes, tr13_mes, tr14_mes, tr15_mes, tr23_mes, 
                               tr24_mes, tr25_mes, tr34_0_mes, tr35_0_mes,tr34_1_mes, tr35_1_mes, 
                               tr45_0_mes,tr45_1_mes,tr45_2_mes,tr45_12_mes)), na.rm=T),
    
    tr_cover = rowMeans(across(c(tr12_cover, tr13_cover, tr14_cover, tr15_cover, tr23_cover, 
                                 tr24_cover, tr25_cover, tr34_0_cover, tr35_0_cover,tr34_1_cover, tr35_1_cover, 
                                 tr45_0_cover,tr45_1_cover,tr45_2_cover,tr45_12_cover)), na.rm=T),

tr_power = rowMeans(across(c(tr12_power, tr13_power, tr14_power, tr15_power, tr23_power, 
                             tr24_power, tr25_power, tr34_0_power, tr35_0_power,tr34_1_power, tr35_1_power, 
                             tr45_0_power,tr45_1_power,tr45_2_power,tr45_12_power)), na.rm=T)

    
  )

nonmarkov_width_t3=mean(c(width_nonmarkov_t3$tr_b), na.rm=T)
nonmarkov_mes_t3=mean(c(width_nonmarkov_t3$tr_mes), na.rm=T)
nonmarkov_coverage_t3=mean(c(width_nonmarkov_t3$tr_cover), na.rm=T)
nonmarkov_power_t3=mean(c(width_nonmarkov_t3$tr_power), na.rm=T)


width_nonmarkov_t4 <-width_nonmarkov_t4 %>%
  mutate(
    ##width
    
    
    tr12_b=(TR12_ul-TR12_ll),
    tr13_b=(TR13_ul-TR13_ll),
    tr14_b=(TR14_ul-TR14_ll),
    tr15_b=(TR15_ul-TR15_ll),
    
    tr23_b=(TR23_ul-TR23_ll),
    tr24_b=(TR24_ul-TR24_ll),
    tr25_b=(TR25_ul-TR25_ll),
    
    tr34_0_b=(TR34_0_ul-TR34_0_ll),
    tr35_0_b=(TR35_0_ul-TR35_0_ll),
    
    tr34_1_b=(TR34_1_ul-TR34_1_ll),
    tr35_1_b=(TR35_1_ul-TR35_1_ll),
    
    tr45_0_b=(TR45_0_ul-TR45_0_ll),
    tr45_1_b=(TR45_1_ul-TR45_1_ll),
    tr45_2_b=(TR45_2_ul-TR45_2_ll),
    tr45_12_b=(TR45_12_ul-TR45_12_ll),
    
    
    ##mse
    
    tr12_mes=(TR12_true-TR12)^2,
    tr13_mes=(TR13_true-TR13)^2,
    tr14_mes=(TR14_true-TR14)^2,
    tr15_mes=(TR15_true-TR15)^2,
    
    tr23_mes=(TR23_true-TR23)^2,
    tr24_mes=(TR24_true-TR24)^2,
    tr25_mes=(TR25_true-TR25)^2,
    
    tr34_0_mes=(TR34_0_true-TR34_0)^2,
    tr35_0_mes=(TR35_0_true-TR35_0)^2,
    
    tr34_1_mes=(TR34_1_true-TR34_1)^2,
    tr35_1_mes=(TR35_1_true-TR35_1)^2,
    
    tr45_0_mes=(TR45_0_true-TR45_0)^2,
    tr45_1_mes=(TR45_1_true-TR45_1)^2,
    tr45_2_mes=(TR45_2_true-TR45_2)^2,
    tr45_12_mes=(TR45_12_true-TR45_12)^2,
    
    
    ##coverage
    
    tr12_cover = case_when(TR12_true<=TR12_ul & TR12_true>=TR12_ll & is.na(TR12_ll)==F ~1,  
                           (TR12_true>TR12_ul | TR12_true<TR12_ll) & is.na(TR12_ll)==F ~0),   
    tr13_cover = case_when(TR13_true<=TR13_ul & TR13_true>=TR13_ll & is.na(TR13_ll)==F ~1,  
                           (TR13_true>TR13_ul | TR13_true<TR13_ll) & is.na(TR13_ll)==F ~0), 
    tr14_cover = case_when(TR14_true<=TR14_ul & TR14_true>=TR14_ll & is.na(TR14_ll)==F ~1,  
                           (TR14_true>TR14_ul | TR14_true<TR14_ll) & is.na(TR14_ll)==F ~0), 
    tr15_cover = case_when(TR15_true<=TR15_ul & TR15_true>=TR15_ll & is.na(TR15_ll)==F ~1,  
                           (TR15_true>TR15_ul | TR15_true<TR15_ll) & is.na(TR15_ll)==F ~0), 
    tr23_cover = case_when(TR23_true<=TR23_ul & TR23_true>=TR23_ll & is.na(TR23_ll)==F ~1,  
                           (TR23_true>TR23_ul | TR23_true<TR23_ll) & is.na(TR23_ll)==F ~0), 
    tr24_cover = case_when(TR24_true<=TR24_ul & TR24_true>=TR24_ll & is.na(TR24_ll)==F ~1,  
                           (TR24_true>TR24_ul | TR24_true<TR24_ll) & is.na(TR24_ll)==F ~0), 
    tr25_cover = case_when(TR25_true<=TR25_ul & TR25_true>=TR25_ll & is.na(TR25_ll)==F ~1,  
                           (TR25_true>TR25_ul | TR25_true<TR25_ll) & is.na(TR25_ll)==F ~0), 
    tr34_0_cover = case_when(TR34_0_true<=TR34_0_ul & TR34_0_true>=TR34_0_ll & is.na(TR34_0_ll)==F ~1,  
                             (TR34_0_true>TR34_0_ul | TR34_0_true<TR34_0_ll) & is.na(TR34_0_ll)==F ~0), 
    tr35_0_cover = case_when(TR35_0_true<=TR35_0_ul & TR35_0_true>=TR35_0_ll & is.na(TR35_0_ll)==F ~1,  
                             (TR35_0_true>TR35_0_ul | TR35_0_true<TR35_0_ll) & is.na(TR35_0_ll)==F ~0), 
    tr34_1_cover = case_when(TR34_1_true<=TR34_1_ul & TR34_1_true>=TR34_1_ll & is.na(TR34_1_ll)==F ~1,  
                             (TR34_1_true>TR34_1_ul | TR34_1_true<TR34_1_ll) & is.na(TR34_1_ll)==F ~0), 
    tr35_1_cover = case_when(TR35_1_true<=TR35_1_ul & TR35_1_true>=TR35_1_ll & is.na(TR35_1_ll)==F ~1,  
                             (TR35_1_true>TR35_1_ul | TR35_1_true<TR35_1_ll) & is.na(TR35_1_ll)==F ~0), 
    tr45_0_cover = case_when(TR45_0_true<=TR45_0_ul & TR45_0_true>=TR45_0_ll & is.na(TR45_0_ll)==F ~1,  
                             (TR45_0_true>TR45_0_ul | TR45_0_true<TR45_0_ll) & is.na(TR45_0_ll)==F ~0), 
    tr45_1_cover = case_when(TR45_1_true<=TR45_1_ul & TR45_1_true>=TR45_1_ll & is.na(TR45_1_ll)==F ~1,  
                             (TR45_1_true>TR45_1_ul | TR45_1_true<TR45_1_ll) & is.na(TR45_1_ll)==F ~0), 
    tr45_2_cover = case_when(TR45_2_true<=TR45_2_ul & TR45_2_true>=TR45_2_ll & is.na(TR45_2_ll)==F ~1,  
                             (TR45_2_true>TR45_2_ul | TR45_2_true<TR45_2_ll) & is.na(TR45_2_ll)==F ~0), 
    tr45_12_cover = case_when(TR45_12_true<=TR45_12_ul & TR45_12_true>=TR45_12_ll & is.na(TR45_12_ll)==F ~1,  
                              (TR45_12_true>TR45_12_ul | TR45_12_true<TR45_12_ll) & is.na(TR45_12_ll)==F ~0), 
    
##power

tr12_power = case_when(0<=TR12_ul & 0>=TR12_ll & TR12_true!=0 ~0, TRUE~1),
tr13_power = case_when(0<=TR13_ul & 0>=TR13_ll & TR13_true!=0 ~0, TRUE~1),
tr14_power = case_when(0<=TR14_ul & 0>=TR14_ll & TR14_true!=0 ~0, TRUE~1),
tr15_power = case_when(0<=TR15_ul & 0>=TR15_ll & TR15_true!=0 ~0, TRUE~1),

tr23_power = case_when(0<=TR23_ul & 0>=TR23_ll & TR23_true!=0 ~0, TRUE~1),
tr24_power = case_when(0<=TR24_ul & 0>=TR24_ll & TR24_true!=0 ~0, TRUE~1),
tr25_power = case_when(0<=TR25_ul & 0>=TR25_ll & TR25_true!=0 ~0, TRUE~1),

tr34_0_power = case_when(0<=TR34_0_ul & 0>=TR34_0_ll & TR34_0_true!=0 ~0, TRUE~1),
tr34_1_power = case_when(0<=TR34_1_ul & 0>=TR34_1_ll & TR34_1_true!=0 ~0, TRUE~1),
tr35_0_power = case_when(0<=TR35_0_ul & 0>=TR35_0_ll & TR35_0_true!=0 ~0, TRUE~1),
tr35_1_power = case_when(0<=TR35_1_ul & 0>=TR35_1_ll & TR35_1_true!=0 ~0, TRUE~1),

tr45_0_power = case_when(0<=TR45_0_ul & 0>=TR45_0_ll & TR45_0_true!=0 ~0, TRUE~1),
tr45_1_power = case_when(0<=TR45_1_ul & 0>=TR45_1_ll & TR45_1_true!=0 ~0, TRUE~1),
tr45_2_power = case_when(0<=TR45_2_ul & 0>=TR45_2_ll & TR45_2_true!=0 ~0, TRUE~1),
tr45_12_power = case_when(0<=TR45_12_ul & 0>=TR45_12_ll & TR45_12_true!=0 ~0, TRUE~1),

   
    tr_b = rowMeans(across(c(tr12_b, tr13_b, tr14_b, tr15_b, tr23_b, 
                             tr24_b, tr25_b, tr34_0_b, tr35_0_b,tr34_1_b, tr35_1_b, 
                             tr45_0_b,tr45_1_b,tr45_2_b,tr45_12_b)), na.rm=T),
    
    tr_mes = rowMeans(across(c(tr12_mes, tr13_mes, tr14_mes, tr15_mes, tr23_mes, 
                               tr24_mes, tr25_mes, tr34_0_mes, tr35_0_mes,tr34_1_mes, tr35_1_mes, 
                               tr45_0_mes,tr45_1_mes,tr45_2_mes,tr45_12_mes)), na.rm=T),
    
    tr_cover = rowMeans(across(c(tr12_cover, tr13_cover, tr14_cover, tr15_cover, tr23_cover, 
                                 tr24_cover, tr25_cover, tr34_0_cover, tr35_0_cover,tr34_1_cover, tr35_1_cover, 
                                 tr45_0_cover,tr45_1_cover,tr45_2_cover,tr45_12_cover)), na.rm=T),

tr_power = rowMeans(across(c(tr12_power, tr13_power, tr14_power, tr15_power, tr23_power, 
                             tr24_power, tr25_power, tr34_0_power, tr35_0_power,tr34_1_power, tr35_1_power, 
                             tr45_0_power,tr45_1_power,tr45_2_power,tr45_12_power)), na.rm=T)

    
  )

nonmarkov_width_t4=mean(c(width_nonmarkov_t4$tr_b), na.rm=T)
nonmarkov_mes_t4=mean(c(width_nonmarkov_t4$tr_mes), na.rm=T)
nonmarkov_coverage_t4=mean(c(width_nonmarkov_t4$tr_cover), na.rm=T)
nonmarkov_power_t4=mean(c(width_nonmarkov_t4$tr_power), na.rm=T)


width_nonmarkov_t5 <-width_nonmarkov_t5 %>%
  mutate(
    ##width
    
    
    tr12_b=(TR12_ul-TR12_ll),
    tr13_b=(TR13_ul-TR13_ll),
    tr14_b=(TR14_ul-TR14_ll),
    tr15_b=(TR15_ul-TR15_ll),
    
    tr23_b=(TR23_ul-TR23_ll),
    tr24_b=(TR24_ul-TR24_ll),
    tr25_b=(TR25_ul-TR25_ll),
    
    tr34_0_b=(TR34_0_ul-TR34_0_ll),
    tr35_0_b=(TR35_0_ul-TR35_0_ll),
    
    tr34_1_b=(TR34_1_ul-TR34_1_ll),
    tr35_1_b=(TR35_1_ul-TR35_1_ll),
    
    tr45_0_b=(TR45_0_ul-TR45_0_ll),
    tr45_1_b=(TR45_1_ul-TR45_1_ll),
    tr45_2_b=(TR45_2_ul-TR45_2_ll),
    tr45_12_b=(TR45_12_ul-TR45_12_ll),
    
    
    ##mse
    
    tr12_mes=(TR12_true-TR12)^2,
    tr13_mes=(TR13_true-TR13)^2,
    tr14_mes=(TR14_true-TR14)^2,
    tr15_mes=(TR15_true-TR15)^2,
    
    tr23_mes=(TR23_true-TR23)^2,
    tr24_mes=(TR24_true-TR24)^2,
    tr25_mes=(TR25_true-TR25)^2,
    
    tr34_0_mes=(TR34_0_true-TR34_0)^2,
    tr35_0_mes=(TR35_0_true-TR35_0)^2,
    
    tr34_1_mes=(TR34_1_true-TR34_1)^2,
    tr35_1_mes=(TR35_1_true-TR35_1)^2,
    
    tr45_0_mes=(TR45_0_true-TR45_0)^2,
    tr45_1_mes=(TR45_1_true-TR45_1)^2,
    tr45_2_mes=(TR45_2_true-TR45_2)^2,
    tr45_12_mes=(TR45_12_true-TR45_12)^2,
    
    
    ##coverage
    
    tr12_cover = case_when(TR12_true<=TR12_ul & TR12_true>=TR12_ll & is.na(TR12_ll)==F ~1,  
                           (TR12_true>TR12_ul | TR12_true<TR12_ll) & is.na(TR12_ll)==F ~0),   
    tr13_cover = case_when(TR13_true<=TR13_ul & TR13_true>=TR13_ll & is.na(TR13_ll)==F ~1,  
                           (TR13_true>TR13_ul | TR13_true<TR13_ll) & is.na(TR13_ll)==F ~0), 
    tr14_cover = case_when(TR14_true<=TR14_ul & TR14_true>=TR14_ll & is.na(TR14_ll)==F ~1,  
                           (TR14_true>TR14_ul | TR14_true<TR14_ll) & is.na(TR14_ll)==F ~0), 
    tr15_cover = case_when(TR15_true<=TR15_ul & TR15_true>=TR15_ll & is.na(TR15_ll)==F ~1,  
                           (TR15_true>TR15_ul | TR15_true<TR15_ll) & is.na(TR15_ll)==F ~0), 
    tr23_cover = case_when(TR23_true<=TR23_ul & TR23_true>=TR23_ll & is.na(TR23_ll)==F ~1,  
                           (TR23_true>TR23_ul | TR23_true<TR23_ll) & is.na(TR23_ll)==F ~0), 
    tr24_cover = case_when(TR24_true<=TR24_ul & TR24_true>=TR24_ll & is.na(TR24_ll)==F ~1,  
                           (TR24_true>TR24_ul | TR24_true<TR24_ll) & is.na(TR24_ll)==F ~0), 
    tr25_cover = case_when(TR25_true<=TR25_ul & TR25_true>=TR25_ll & is.na(TR25_ll)==F ~1,  
                           (TR25_true>TR25_ul | TR25_true<TR25_ll) & is.na(TR25_ll)==F ~0), 
    tr34_0_cover = case_when(TR34_0_true<=TR34_0_ul & TR34_0_true>=TR34_0_ll & is.na(TR34_0_ll)==F ~1,  
                             (TR34_0_true>TR34_0_ul | TR34_0_true<TR34_0_ll) & is.na(TR34_0_ll)==F ~0), 
    tr35_0_cover = case_when(TR35_0_true<=TR35_0_ul & TR35_0_true>=TR35_0_ll & is.na(TR35_0_ll)==F ~1,  
                             (TR35_0_true>TR35_0_ul | TR35_0_true<TR35_0_ll) & is.na(TR35_0_ll)==F ~0), 
    tr34_1_cover = case_when(TR34_1_true<=TR34_1_ul & TR34_1_true>=TR34_1_ll & is.na(TR34_1_ll)==F ~1,  
                             (TR34_1_true>TR34_1_ul | TR34_1_true<TR34_1_ll) & is.na(TR34_1_ll)==F ~0), 
    tr35_1_cover = case_when(TR35_1_true<=TR35_1_ul & TR35_1_true>=TR35_1_ll & is.na(TR35_1_ll)==F ~1,  
                             (TR35_1_true>TR35_1_ul | TR35_1_true<TR35_1_ll) & is.na(TR35_1_ll)==F ~0), 
    tr45_0_cover = case_when(TR45_0_true<=TR45_0_ul & TR45_0_true>=TR45_0_ll & is.na(TR45_0_ll)==F ~1,  
                             (TR45_0_true>TR45_0_ul | TR45_0_true<TR45_0_ll) & is.na(TR45_0_ll)==F ~0), 
    tr45_1_cover = case_when(TR45_1_true<=TR45_1_ul & TR45_1_true>=TR45_1_ll & is.na(TR45_1_ll)==F ~1,  
                             (TR45_1_true>TR45_1_ul | TR45_1_true<TR45_1_ll) & is.na(TR45_1_ll)==F ~0), 
    tr45_2_cover = case_when(TR45_2_true<=TR45_2_ul & TR45_2_true>=TR45_2_ll & is.na(TR45_2_ll)==F ~1,  
                             (TR45_2_true>TR45_2_ul | TR45_2_true<TR45_2_ll) & is.na(TR45_2_ll)==F ~0), 
    tr45_12_cover = case_when(TR45_12_true<=TR45_12_ul & TR45_12_true>=TR45_12_ll & is.na(TR45_12_ll)==F ~1,  
                              (TR45_12_true>TR45_12_ul | TR45_12_true<TR45_12_ll) & is.na(TR45_12_ll)==F ~0), 
    
    
  ##power

tr12_power = case_when(0<=TR12_ul & 0>=TR12_ll & TR12_true!=0 ~0, TRUE~1),
tr13_power = case_when(0<=TR13_ul & 0>=TR13_ll & TR13_true!=0 ~0, TRUE~1),
tr14_power = case_when(0<=TR14_ul & 0>=TR14_ll & TR14_true!=0 ~0, TRUE~1),
tr15_power = case_when(0<=TR15_ul & 0>=TR15_ll & TR15_true!=0 ~0, TRUE~1),

tr23_power = case_when(0<=TR23_ul & 0>=TR23_ll & TR23_true!=0 ~0, TRUE~1),
tr24_power = case_when(0<=TR24_ul & 0>=TR24_ll & TR24_true!=0 ~0, TRUE~1),
tr25_power = case_when(0<=TR25_ul & 0>=TR25_ll & TR25_true!=0 ~0, TRUE~1),

tr34_0_power = case_when(0<=TR34_0_ul & 0>=TR34_0_ll & TR34_0_true!=0 ~0, TRUE~1),
tr34_1_power = case_when(0<=TR34_1_ul & 0>=TR34_1_ll & TR34_1_true!=0 ~0, TRUE~1),
tr35_0_power = case_when(0<=TR35_0_ul & 0>=TR35_0_ll & TR35_0_true!=0 ~0, TRUE~1),
tr35_1_power = case_when(0<=TR35_1_ul & 0>=TR35_1_ll & TR35_1_true!=0 ~0, TRUE~1),

tr45_0_power = case_when(0<=TR45_0_ul & 0>=TR45_0_ll & TR45_0_true!=0 ~0, TRUE~1),
tr45_1_power = case_when(0<=TR45_1_ul & 0>=TR45_1_ll & TR45_1_true!=0 ~0, TRUE~1),
tr45_2_power = case_when(0<=TR45_2_ul & 0>=TR45_2_ll & TR45_2_true!=0 ~0, TRUE~1),
tr45_12_power = case_when(0<=TR45_12_ul & 0>=TR45_12_ll & TR45_12_true!=0 ~0, TRUE~1),


    tr_b = rowMeans(across(c(tr12_b, tr13_b, tr14_b, tr15_b, tr23_b, 
                             tr24_b, tr25_b, tr34_0_b, tr35_0_b,tr34_1_b, tr35_1_b, 
                             tr45_0_b,tr45_1_b,tr45_2_b,tr45_12_b)), na.rm=T),
    
    tr_mes = rowMeans(across(c(tr12_mes, tr13_mes, tr14_mes, tr15_mes, tr23_mes, 
                               tr24_mes, tr25_mes, tr34_0_mes, tr35_0_mes,tr34_1_mes, tr35_1_mes, 
                               tr45_0_mes,tr45_1_mes,tr45_2_mes,tr45_12_mes)), na.rm=T),
    
    tr_cover = rowMeans(across(c(tr12_cover, tr13_cover, tr14_cover, tr15_cover, tr23_cover, 
                                 tr24_cover, tr25_cover, tr34_0_cover, tr35_0_cover,tr34_1_cover, tr35_1_cover, 
                                 tr45_0_cover,tr45_1_cover,tr45_2_cover,tr45_12_cover)), na.rm=T),

tr_power = rowMeans(across(c(tr12_power, tr13_power, tr14_power, tr15_power, tr23_power, 
                             tr24_power, tr25_power, tr34_0_power, tr35_0_power,tr34_1_power, tr35_1_power, 
                             tr45_0_power,tr45_1_power,tr45_2_power,tr45_12_power)), na.rm=T)

    
    
  )

nonmarkov_width_t5=mean(c(width_nonmarkov_t5$tr_b), na.rm=T)
nonmarkov_mes_t5=mean(c(width_nonmarkov_t5$tr_mes), na.rm=T)
nonmarkov_coverage_t5=mean(c(width_nonmarkov_t5$tr_cover), na.rm=T)
nonmarkov_power_t5=mean(c(width_nonmarkov_t5$tr_power), na.rm=T)




##summary

markov_width=mean(c(markov_width_t1, markov_width_t2,markov_width_t3,
                    markov_width_t4,markov_width_t5), na.rm=T)
markov_mes=mean(c(markov_mes_t1, markov_mes_t2,markov_mes_t3,
                  markov_mes_t4,markov_mes_t5), na.rm=T)

markov_coverage=mean(c(markov_coverage_t1, markov_coverage_t2,markov_coverage_t3,
                       markov_coverage_t4,markov_coverage_t5), na.rm=T)

markov_power=mean(c(markov_power_t1, markov_power_t2,markov_power_t3,
                       markov_power_t4,markov_power_t5), na.rm=T)


nonmarkov_width=mean(c(nonmarkov_width_t1, nonmarkov_width_t2,nonmarkov_width_t3,
                       nonmarkov_width_t4,nonmarkov_width_t5), na.rm=T)

nonmarkov_mes=mean(c(nonmarkov_mes_t1, nonmarkov_mes_t2,nonmarkov_mes_t3,
                     nonmarkov_mes_t4,nonmarkov_mes_t5), na.rm=T)

nonmarkov_coverage=mean(c(nonmarkov_coverage_t1, nonmarkov_coverage_t2,nonmarkov_coverage_t3,
                          nonmarkov_coverage_t4,nonmarkov_coverage_t5), na.rm=T)

nonmarkov_power=mean(c(nonmarkov_power_t1, nonmarkov_power_t2,nonmarkov_power_t3,
                          nonmarkov_power_t4,nonmarkov_power_t5), na.rm=T)



##to plot width figures

markov_width_trend=rbind(markov_width_t1,markov_width_t2,markov_width_t3,markov_width_t4,markov_width_t5)

nonmarkov_width_trend=rbind(nonmarkov_width_t1,nonmarkov_width_t2,nonmarkov_width_t3,nonmarkov_width_t4,nonmarkov_width_t5)

time=rbind(1,2,3,4,5)

width_trend=data.frame(cbind(time, markov_width_trend,nonmarkov_width_trend))

colnames(width_trend)=c("time", "markov","nonmarkov")



##mes

markov_mes_trend=rbind(markov_mes_t1,markov_mes_t2,markov_mes_t3,markov_mes_t4,markov_mes_t5)

nonmarkov_mes_trend=rbind(nonmarkov_mes_t1,nonmarkov_mes_t2,nonmarkov_mes_t3,nonmarkov_mes_t4,nonmarkov_mes_t5)

mes_trend=data.frame(cbind(time, markov_mes_trend,nonmarkov_mes_trend))

colnames(mes_trend)=c("time", "markov","nonmarkov")


##coverage

markov_coverage_trend=rbind(markov_coverage_t1,markov_coverage_t2,markov_coverage_t3,markov_coverage_t4,markov_coverage_t5)

nonmarkov_coverage_trend=rbind(nonmarkov_coverage_t1,nonmarkov_coverage_t2,nonmarkov_coverage_t3,nonmarkov_coverage_t4,nonmarkov_coverage_t5)

coverage_trend=data.frame(cbind(time, markov_coverage_trend,nonmarkov_coverage_trend))

colnames(coverage_trend)=c("time", "markov","nonmarkov")

##power

markov_power_trend=rbind(markov_power_t1,markov_power_t2,markov_power_t3,markov_power_t4,markov_power_t5)

nonmarkov_power_trend=rbind(nonmarkov_power_t1,nonmarkov_power_t2,nonmarkov_power_t3,nonmarkov_power_t4,nonmarkov_power_t5)

power_trend=data.frame(cbind(time, markov_power_trend,nonmarkov_power_trend))

colnames(power_trend)=c("time", "markov","nonmarkov")



##width for each state


markov_tr12_width_matrix=cbind(width_markov_t1$tr12_b, width_markov_t2$tr12_b, width_markov_t3$tr12_b, width_markov_t4$tr12_b,
                               width_markov_t5$tr12_b)

markov_tr12_mes_matrix=cbind(width_markov_t1$tr12_mes, width_markov_t2$tr12_mes, width_markov_t3$tr12_mes, width_markov_t4$tr12_mes,
                             width_markov_t5$tr12_mes)

markov_tr12_cover_matrix=cbind(width_markov_t1$tr12_cover, width_markov_t2$tr12_cover, width_markov_t3$tr12_cover, width_markov_t4$tr12_cover,
                               width_markov_t5$tr12_cover)

markov_tr12_power_matrix=cbind(width_markov_t1$tr12_power, width_markov_t2$tr12_power, width_markov_t3$tr12_power, width_markov_t4$tr12_power,
                               width_markov_t5$tr12_power)

markov_tr12_width<-mean(c(rowMeans(markov_tr12_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr12_mes<-mean(c(rowMeans(markov_tr12_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr12_cover<-mean(c(rowMeans(markov_tr12_cover_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr12_power<-mean(c(rowMeans(markov_tr12_power_matrix[,1:5], na.rm=T)), na.rm=T)


markov_tr13_width_matrix=cbind(width_markov_t1$tr13_b, width_markov_t2$tr13_b, width_markov_t3$tr13_b, width_markov_t4$tr13_b,
                               width_markov_t5$tr13_b)

markov_tr13_mes_matrix=cbind(width_markov_t1$tr13_mes, width_markov_t2$tr13_mes, width_markov_t3$tr13_mes, width_markov_t4$tr13_mes,
                             width_markov_t5$tr13_mes)

markov_tr13_cover_matrix=cbind(width_markov_t1$tr13_cover, width_markov_t2$tr13_cover, width_markov_t3$tr13_cover, width_markov_t4$tr13_cover,
                               width_markov_t5$tr13_cover)

markov_tr13_width<-mean(c(rowMeans(markov_tr13_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr13_mes<-mean(c(rowMeans(markov_tr13_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr13_cover<-mean(c(rowMeans(markov_tr13_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr13_power_matrix=cbind(width_markov_t1$tr13_power, width_markov_t2$tr13_power, width_markov_t3$tr13_power, width_markov_t4$tr13_power,
                               width_markov_t5$tr13_power)
markov_tr13_power<-mean(c(rowMeans(markov_tr13_power_matrix[,1:5], na.rm=T)), na.rm=T)


markov_tr14_width_matrix=cbind(width_markov_t1$tr14_b, width_markov_t2$tr14_b, width_markov_t3$tr14_b, width_markov_t4$tr14_b,
                               width_markov_t5$tr14_b)

markov_tr14_mes_matrix=cbind(width_markov_t1$tr14_mes, width_markov_t2$tr14_mes, width_markov_t3$tr14_mes, width_markov_t4$tr14_mes,
                             width_markov_t5$tr14_mes)

markov_tr14_cover_matrix=cbind(width_markov_t1$tr14_cover, width_markov_t2$tr14_cover, width_markov_t3$tr14_cover, width_markov_t4$tr14_cover,
                               width_markov_t5$tr14_cover)

markov_tr14_width<-mean(c(rowMeans(markov_tr14_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr14_mes<-mean(c(rowMeans(markov_tr14_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr14_cover<-mean(c(rowMeans(markov_tr14_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr14_power_matrix=cbind(width_markov_t1$tr14_power, width_markov_t2$tr14_power, width_markov_t3$tr14_power, width_markov_t4$tr14_power,
                               width_markov_t5$tr14_power)
markov_tr14_power<-mean(c(rowMeans(markov_tr14_power_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr15_width_matrix=cbind(width_markov_t1$tr15_b, width_markov_t2$tr15_b, width_markov_t3$tr15_b, width_markov_t4$tr15_b,
                               width_markov_t5$tr15_b)

markov_tr15_mes_matrix=cbind(width_markov_t1$tr15_mes, width_markov_t2$tr15_mes, width_markov_t3$tr15_mes, width_markov_t4$tr15_mes,
                             width_markov_t5$tr15_mes)

markov_tr15_cover_matrix=cbind(width_markov_t1$tr15_cover, width_markov_t2$tr15_cover, width_markov_t3$tr15_cover, width_markov_t4$tr15_cover,
                               width_markov_t5$tr15_cover)

markov_tr15_width<-mean(c(rowMeans(markov_tr15_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr15_mes<-mean(c(rowMeans(markov_tr15_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr15_cover<-mean(c(rowMeans(markov_tr15_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr15_power_matrix=cbind(width_markov_t1$tr15_power, width_markov_t2$tr15_power, width_markov_t3$tr15_power, width_markov_t4$tr15_power,
                               width_markov_t5$tr15_power)
markov_tr15_power<-mean(c(rowMeans(markov_tr15_power_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr23_width_matrix=cbind(width_markov_t1$tr23_b, width_markov_t2$tr23_b, width_markov_t3$tr23_b, width_markov_t4$tr23_b,
                               width_markov_t5$tr23_b)

markov_tr23_mes_matrix=cbind(width_markov_t1$tr23_mes, width_markov_t2$tr23_mes, width_markov_t3$tr23_mes, width_markov_t4$tr23_mes,
                             width_markov_t5$tr23_mes)

markov_tr23_cover_matrix=cbind(width_markov_t1$tr23_cover, width_markov_t2$tr23_cover, width_markov_t3$tr23_cover, width_markov_t4$tr23_cover,
                               width_markov_t5$tr23_cover)

markov_tr23_width<-mean(c(rowMeans(markov_tr23_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr23_mes<-mean(c(rowMeans(markov_tr23_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr23_cover<-mean(c(rowMeans(markov_tr23_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr23_power_matrix=cbind(width_markov_t1$tr23_power, width_markov_t2$tr23_power, width_markov_t3$tr23_power, width_markov_t4$tr23_power,
                               width_markov_t5$tr23_power)
markov_tr23_power<-mean(c(rowMeans(markov_tr23_power_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr24_width_matrix=cbind(width_markov_t1$tr24_b, width_markov_t2$tr24_b, width_markov_t3$tr24_b, width_markov_t4$tr24_b,
                               width_markov_t5$tr24_b)

markov_tr24_mes_matrix=cbind(width_markov_t1$tr24_mes, width_markov_t2$tr24_mes, width_markov_t3$tr24_mes, width_markov_t4$tr24_mes,
                             width_markov_t5$tr24_mes)

markov_tr24_cover_matrix=cbind(width_markov_t1$tr24_cover, width_markov_t2$tr24_cover, width_markov_t3$tr24_cover, width_markov_t4$tr24_cover,
                               width_markov_t5$tr24_cover)

markov_tr24_width<-mean(c(rowMeans(markov_tr24_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr24_mes<-mean(c(rowMeans(markov_tr24_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr24_cover<-mean(c(rowMeans(markov_tr24_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr24_power_matrix=cbind(width_markov_t1$tr24_power, width_markov_t2$tr24_power, width_markov_t3$tr24_power, width_markov_t4$tr24_power,
                               width_markov_t5$tr24_power)
markov_tr24_power<-mean(c(rowMeans(markov_tr24_power_matrix[,1:5], na.rm=T)), na.rm=T)


markov_tr25_width_matrix=cbind(width_markov_t1$tr25_b, width_markov_t2$tr25_b, width_markov_t3$tr25_b, width_markov_t4$tr25_b,
                               width_markov_t5$tr25_b)

markov_tr25_mes_matrix=cbind(width_markov_t1$tr25_mes, width_markov_t2$tr25_mes, width_markov_t3$tr25_mes, width_markov_t4$tr25_mes,
                             width_markov_t5$tr25_mes)

markov_tr25_cover_matrix=cbind(width_markov_t1$tr25_cover, width_markov_t2$tr25_cover, width_markov_t3$tr25_cover, width_markov_t4$tr25_cover,
                               width_markov_t5$tr25_cover)

markov_tr25_width<-mean(c(rowMeans(markov_tr25_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr25_mes<-mean(c(rowMeans(markov_tr25_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr25_cover<-mean(c(rowMeans(markov_tr25_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr25_power_matrix=cbind(width_markov_t1$tr25_power, width_markov_t2$tr25_power, width_markov_t3$tr25_power, width_markov_t4$tr25_power,
                               width_markov_t5$tr25_power)
markov_tr25_power<-mean(c(rowMeans(markov_tr25_power_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr34_0_width_matrix=cbind(width_markov_t1$tr34_0_b, width_markov_t2$tr34_0_b, width_markov_t3$tr34_0_b, width_markov_t4$tr34_0_b,
                                 width_markov_t5$tr34_0_b)

markov_tr34_0_mes_matrix=cbind(width_markov_t1$tr34_0_mes, width_markov_t2$tr34_0_mes, width_markov_t3$tr34_0_mes, width_markov_t4$tr34_0_mes,
                               width_markov_t5$tr34_0_mes)

markov_tr34_0_cover_matrix=cbind(width_markov_t1$tr34_0_cover, width_markov_t2$tr34_0_cover, width_markov_t3$tr34_0_cover, width_markov_t4$tr34_0_cover,
                                 width_markov_t5$tr34_0_cover)

markov_tr34_0_width<-mean(c(rowMeans(markov_tr34_0_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr34_0_mes<-mean(c(rowMeans(markov_tr34_0_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr34_0_cover<-mean(c(rowMeans(markov_tr34_0_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr34_0_power_matrix=cbind(width_markov_t1$tr34_0_power, width_markov_t2$tr34_0_power, width_markov_t3$tr34_0_power, width_markov_t4$tr34_0_power,
                               width_markov_t5$tr34_0_power)
markov_tr34_0_power<-mean(c(rowMeans(markov_tr34_0_power_matrix[,1:5], na.rm=T)), na.rm=T)


markov_tr34_1_width_matrix=cbind(width_markov_t1$tr34_1_b, width_markov_t2$tr34_1_b, width_markov_t3$tr34_1_b, width_markov_t4$tr34_1_b,
                                 width_markov_t5$tr34_1_b)

markov_tr34_1_mes_matrix=cbind(width_markov_t1$tr34_1_mes, width_markov_t2$tr34_1_mes, width_markov_t3$tr34_1_mes, width_markov_t4$tr34_1_mes,
                               width_markov_t5$tr34_1_mes)

markov_tr34_1_cover_matrix=cbind(width_markov_t1$tr34_1_cover, width_markov_t2$tr34_1_cover, width_markov_t3$tr34_1_cover, width_markov_t4$tr34_1_cover,
                                 width_markov_t5$tr34_1_cover)

markov_tr34_1_width<-mean(c(rowMeans(markov_tr34_1_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr34_1_mes<-mean(c(rowMeans(markov_tr34_1_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr34_1_cover<-mean(c(rowMeans(markov_tr34_1_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr34_1_power_matrix=cbind(width_markov_t1$tr34_1_power, width_markov_t2$tr34_1_power, width_markov_t3$tr34_1_power, width_markov_t4$tr34_1_power,
                               width_markov_t5$tr34_1_power)
markov_tr34_1_power<-mean(c(rowMeans(markov_tr34_1_power_matrix[,1:5], na.rm=T)), na.rm=T)


markov_tr35_0_width_matrix=cbind(width_markov_t1$tr35_0_b, width_markov_t2$tr35_0_b, width_markov_t3$tr35_0_b, width_markov_t4$tr35_0_b,
                                 width_markov_t5$tr35_0_b)

markov_tr35_0_mes_matrix=cbind(width_markov_t1$tr35_0_mes, width_markov_t2$tr35_0_mes, width_markov_t3$tr35_0_mes, width_markov_t4$tr35_0_mes,
                               width_markov_t5$tr35_0_mes)

markov_tr35_0_cover_matrix=cbind(width_markov_t1$tr35_0_cover, width_markov_t2$tr35_0_cover, width_markov_t3$tr35_0_cover, width_markov_t4$tr35_0_cover,
                                 width_markov_t5$tr35_0_cover)

markov_tr35_0_width<-mean(c(rowMeans(markov_tr35_0_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr35_0_mes<-mean(c(rowMeans(markov_tr35_0_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr35_0_cover<-mean(c(rowMeans(markov_tr35_0_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr35_0_power_matrix=cbind(width_markov_t1$tr35_0_power, width_markov_t2$tr35_0_power, width_markov_t3$tr35_0_power, width_markov_t4$tr35_0_power,
                               width_markov_t5$tr35_0_power)
markov_tr35_0_power<-mean(c(rowMeans(markov_tr35_0_power_matrix[,1:5], na.rm=T)), na.rm=T)


markov_tr35_1_width_matrix=cbind(width_markov_t1$tr35_1_b, width_markov_t2$tr35_1_b, width_markov_t3$tr35_1_b, width_markov_t4$tr35_1_b,
                                 width_markov_t5$tr35_1_b)

markov_tr35_1_mes_matrix=cbind(width_markov_t1$tr35_1_mes, width_markov_t2$tr35_1_mes, width_markov_t3$tr35_1_mes, width_markov_t4$tr35_1_mes,
                               width_markov_t5$tr35_1_mes)

markov_tr35_1_cover_matrix=cbind(width_markov_t1$tr35_1_cover, width_markov_t2$tr35_1_cover, width_markov_t3$tr35_1_cover, width_markov_t4$tr35_1_cover,
                                 width_markov_t5$tr35_1_cover)

markov_tr35_1_width<-mean(c(rowMeans(markov_tr35_1_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr35_1_mes<-mean(c(rowMeans(markov_tr35_1_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr35_1_cover<-mean(c(rowMeans(markov_tr35_1_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr35_1_power_matrix=cbind(width_markov_t1$tr35_1_power, width_markov_t2$tr35_1_power, width_markov_t3$tr35_1_power, width_markov_t4$tr35_1_power,
                               width_markov_t5$tr35_1_power)
markov_tr35_1_power<-mean(c(rowMeans(markov_tr35_1_power_matrix[,1:5], na.rm=T)), na.rm=T)


markov_tr45_0_width_matrix=cbind(width_markov_t1$tr45_0_b, width_markov_t2$tr45_0_b, width_markov_t3$tr45_0_b, width_markov_t4$tr45_0_b,
                                 width_markov_t5$tr45_0_b)

markov_tr45_0_mes_matrix=cbind(width_markov_t1$tr45_0_mes, width_markov_t2$tr45_0_mes, width_markov_t3$tr45_0_mes, width_markov_t4$tr45_0_mes,
                               width_markov_t5$tr45_0_mes)

markov_tr45_0_cover_matrix=cbind(width_markov_t1$tr45_0_cover, width_markov_t2$tr45_0_cover, width_markov_t3$tr45_0_cover, width_markov_t4$tr45_0_cover,
                                 width_markov_t5$tr45_0_cover)

markov_tr45_0_width<-mean(c(rowMeans(markov_tr45_0_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr45_0_mes<-mean(c(rowMeans(markov_tr45_0_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr45_0_cover<-mean(c(rowMeans(markov_tr45_0_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr45_0_power_matrix=cbind(width_markov_t1$tr45_0_power, width_markov_t2$tr45_0_power, width_markov_t3$tr45_0_power, width_markov_t4$tr45_0_power,
                               width_markov_t5$tr45_0_power)
markov_tr45_0_power<-mean(c(rowMeans(markov_tr45_0_power_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr45_1_width_matrix=cbind(width_markov_t1$tr45_1_b, width_markov_t2$tr45_1_b, width_markov_t3$tr45_1_b, width_markov_t4$tr45_1_b,
                                 width_markov_t5$tr45_1_b)

markov_tr45_1_mes_matrix=cbind(width_markov_t1$tr45_1_mes, width_markov_t2$tr45_1_mes, width_markov_t3$tr45_1_mes, width_markov_t4$tr45_1_mes,
                               width_markov_t5$tr45_1_mes)

markov_tr45_1_cover_matrix=cbind(width_markov_t1$tr45_1_cover, width_markov_t2$tr45_1_cover, width_markov_t3$tr45_1_cover, width_markov_t4$tr45_1_cover,
                                 width_markov_t5$tr45_1_cover)

markov_tr45_1_width<-mean(c(rowMeans(markov_tr45_1_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr45_1_mes<-mean(c(rowMeans(markov_tr45_1_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr45_1_cover<-mean(c(rowMeans(markov_tr45_1_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr45_1_power_matrix=cbind(width_markov_t1$tr45_1_power, width_markov_t2$tr45_1_power, width_markov_t3$tr45_1_power, width_markov_t4$tr45_1_power,
                               width_markov_t5$tr45_1_power)
markov_tr45_1_power<-mean(c(rowMeans(markov_tr45_1_power_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr45_2_width_matrix=cbind(width_markov_t1$tr45_2_b, width_markov_t2$tr45_2_b, width_markov_t3$tr45_2_b, width_markov_t4$tr45_2_b,
                                 width_markov_t5$tr45_2_b)

markov_tr45_2_mes_matrix=cbind(width_markov_t1$tr45_2_mes, width_markov_t2$tr45_2_mes, width_markov_t3$tr45_2_mes, width_markov_t4$tr45_2_mes,
                               width_markov_t5$tr45_2_mes)

markov_tr45_2_cover_matrix=cbind(width_markov_t1$tr45_2_cover, width_markov_t2$tr45_2_cover, width_markov_t3$tr45_2_cover, width_markov_t4$tr45_2_cover,
                                 width_markov_t5$tr45_2_cover)

markov_tr45_2_width<-mean(c(rowMeans(markov_tr45_2_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr45_2_mes<-mean(c(rowMeans(markov_tr45_2_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr45_2_cover<-mean(c(rowMeans(markov_tr45_2_cover_matrix[,1:5], na.rm=T)), na.rm=T)

markov_tr45_2_power_matrix=cbind(width_markov_t1$tr45_2_power, width_markov_t2$tr45_2_power, width_markov_t3$tr45_2_power, width_markov_t4$tr45_2_power,
                               width_markov_t5$tr45_2_power)
markov_tr45_2_power<-mean(c(rowMeans(markov_tr45_2_power_matrix[,1:5], na.rm=T)), na.rm=T)


markov_tr45_12_width_matrix=cbind(width_markov_t1$tr45_12_b, width_markov_t2$tr45_12_b, width_markov_t3$tr45_12_b, width_markov_t4$tr45_12_b,
                                  width_markov_t5$tr45_12_b)

markov_tr45_12_mes_matrix=cbind(width_markov_t1$tr45_12_mes, width_markov_t2$tr45_12_mes, width_markov_t3$tr45_12_mes, width_markov_t4$tr45_12_mes,
                                width_markov_t5$tr45_12_mes)

markov_tr45_12_cover_matrix=cbind(width_markov_t1$tr45_12_cover, width_markov_t2$tr45_12_cover, width_markov_t3$tr45_12_cover, width_markov_t4$tr45_12_cover,
                                  width_markov_t5$tr45_12_cover)

markov_tr45_12_width<-mean(c(rowMeans(markov_tr45_12_width_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr45_12_mes<-mean(c(rowMeans(markov_tr45_12_mes_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr45_12_cover<-mean(c(rowMeans(markov_tr45_12_cover_matrix[,1:5], na.rm=T)), na.rm=T)
markov_tr45_12_power_matrix=cbind(width_markov_t1$tr45_12_power, width_markov_t2$tr45_12_power, width_markov_t3$tr45_12_power, width_markov_t4$tr45_12_power,
                               width_markov_t5$tr45_12_power)
markov_tr45_12_power<-mean(c(rowMeans(markov_tr45_12_power_matrix[,1:5], na.rm=T)), na.rm=T)


##non markov

nonmarkov_tr12_width_matrix=cbind(width_nonmarkov_t1$tr12_b, width_nonmarkov_t2$tr12_b, width_nonmarkov_t3$tr12_b, width_nonmarkov_t4$tr12_b,
                                  width_nonmarkov_t5$tr12_b)

nonmarkov_tr12_mes_matrix=cbind(width_nonmarkov_t1$tr12_mes, width_nonmarkov_t2$tr12_mes, width_nonmarkov_t3$tr12_mes, width_nonmarkov_t4$tr12_mes,
                                width_nonmarkov_t5$tr12_mes)

nonmarkov_tr12_cover_matrix=cbind(width_nonmarkov_t1$tr12_cover, width_nonmarkov_t2$tr12_cover, width_nonmarkov_t3$tr12_cover, width_nonmarkov_t4$tr12_cover,
                                  width_nonmarkov_t5$tr12_cover)

nonmarkov_tr12_width<-mean(c(rowMeans(nonmarkov_tr12_width_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr12_mes<-mean(c(rowMeans(nonmarkov_tr12_mes_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr12_cover<-mean(c(rowMeans(nonmarkov_tr12_cover_matrix[,1:5], na.rm=T)), na.rm=T)


nonmarkov_tr13_width_matrix=cbind(width_nonmarkov_t1$tr13_b, width_nonmarkov_t2$tr13_b, width_nonmarkov_t3$tr13_b, width_nonmarkov_t4$tr13_b,
                                  width_nonmarkov_t5$tr13_b)

nonmarkov_tr13_mes_matrix=cbind(width_nonmarkov_t1$tr13_mes, width_nonmarkov_t2$tr13_mes, width_nonmarkov_t3$tr13_mes, width_nonmarkov_t4$tr13_mes,
                                width_nonmarkov_t5$tr13_mes)

nonmarkov_tr13_cover_matrix=cbind(width_nonmarkov_t1$tr13_cover, width_nonmarkov_t2$tr13_cover, width_nonmarkov_t3$tr13_cover, width_nonmarkov_t4$tr13_cover,
                                  width_nonmarkov_t5$tr13_cover)

nonmarkov_tr13_width<-mean(c(rowMeans(nonmarkov_tr13_width_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr13_mes<-mean(c(rowMeans(nonmarkov_tr13_mes_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr13_cover<-mean(c(rowMeans(nonmarkov_tr13_cover_matrix[,1:5], na.rm=T)), na.rm=T)


nonmarkov_tr14_width_matrix=cbind(width_nonmarkov_t1$tr14_b, width_nonmarkov_t2$tr14_b, width_nonmarkov_t3$tr14_b, width_nonmarkov_t4$tr14_b,
                                  width_nonmarkov_t5$tr14_b)

nonmarkov_tr14_mes_matrix=cbind(width_nonmarkov_t1$tr14_mes, width_nonmarkov_t2$tr14_mes, width_nonmarkov_t3$tr14_mes, width_nonmarkov_t4$tr14_mes,
                                width_nonmarkov_t5$tr14_mes)

nonmarkov_tr14_cover_matrix=cbind(width_nonmarkov_t1$tr14_cover, width_nonmarkov_t2$tr14_cover, width_nonmarkov_t3$tr14_cover, width_nonmarkov_t4$tr14_cover,
                                  width_nonmarkov_t5$tr14_cover)

nonmarkov_tr14_width<-mean(rowMeans(nonmarkov_tr14_width_matrix[,1:5], na.rm=T), na.rm=T)
nonmarkov_tr14_mes<-mean(rowMeans(nonmarkov_tr14_mes_matrix[,1:5], na.rm=T), na.rm=T)
nonmarkov_tr14_cover<-mean(rowMeans(nonmarkov_tr14_cover_matrix[,1:5], na.rm=T), na.rm=T)


nonmarkov_tr15_width_matrix=cbind(width_nonmarkov_t1$tr15_b, width_nonmarkov_t2$tr15_b, width_nonmarkov_t3$tr15_b, width_nonmarkov_t4$tr15_b,
                                  width_nonmarkov_t5$tr15_b)

nonmarkov_tr15_mes_matrix=cbind(width_nonmarkov_t1$tr15_mes, width_nonmarkov_t2$tr15_mes, width_nonmarkov_t3$tr15_mes, width_nonmarkov_t4$tr15_mes,
                                width_nonmarkov_t5$tr15_mes)

nonmarkov_tr15_cover_matrix=cbind(width_nonmarkov_t1$tr15_cover, width_nonmarkov_t2$tr15_cover, width_nonmarkov_t3$tr15_cover, width_nonmarkov_t4$tr15_cover,
                                  width_nonmarkov_t5$tr15_cover)

nonmarkov_tr15_width<-mean(rowMeans(nonmarkov_tr15_width_matrix[,1:5], na.rm=T), na.rm=T)
nonmarkov_tr15_mes<-mean(rowMeans(nonmarkov_tr15_mes_matrix[,1:5], na.rm=T), na.rm=T)
nonmarkov_tr15_cover<-mean(rowMeans(nonmarkov_tr15_cover_matrix[,1:5], na.rm=T), na.rm=T)


nonmarkov_tr23_width_matrix=cbind(width_nonmarkov_t1$tr23_b, width_nonmarkov_t2$tr23_b, width_nonmarkov_t3$tr23_b, width_nonmarkov_t4$tr23_b,
                                  width_nonmarkov_t5$tr23_b)

nonmarkov_tr23_mes_matrix=cbind(width_nonmarkov_t1$tr23_mes, width_nonmarkov_t2$tr23_mes, width_nonmarkov_t3$tr23_mes, width_nonmarkov_t4$tr23_mes,
                                width_nonmarkov_t5$tr23_mes)

nonmarkov_tr23_cover_matrix=cbind(width_nonmarkov_t1$tr23_cover, width_nonmarkov_t2$tr23_cover, width_nonmarkov_t3$tr23_cover, width_nonmarkov_t4$tr23_cover,
                                  width_nonmarkov_t5$tr23_cover)

nonmarkov_tr23_width<-mean(rowMeans(nonmarkov_tr23_width_matrix[,1:5], na.rm=T), na.rm=T)
nonmarkov_tr23_mes<-mean(rowMeans(nonmarkov_tr23_mes_matrix[,1:5], na.rm=T), na.rm=T)
nonmarkov_tr23_cover<-mean(rowMeans(nonmarkov_tr23_cover_matrix[,1:5], na.rm=T), na.rm=T)


nonmarkov_tr24_width_matrix=cbind(width_nonmarkov_t1$tr24_b, width_nonmarkov_t2$tr24_b, width_nonmarkov_t3$tr24_b, width_nonmarkov_t4$tr24_b,
                                  width_nonmarkov_t5$tr24_b)

nonmarkov_tr24_mes_matrix=cbind(width_nonmarkov_t1$tr24_mes, width_nonmarkov_t2$tr24_mes, width_nonmarkov_t3$tr24_mes, width_nonmarkov_t4$tr24_mes,
                                width_nonmarkov_t5$tr24_mes)

nonmarkov_tr24_cover_matrix=cbind(width_nonmarkov_t1$tr24_cover, width_nonmarkov_t2$tr24_cover, width_nonmarkov_t3$tr24_cover, width_nonmarkov_t4$tr24_cover,
                                  width_nonmarkov_t5$tr24_cover)

nonmarkov_tr24_width<-mean(rowMeans(nonmarkov_tr24_width_matrix[,1:5], na.rm=T), na.rm=T)
nonmarkov_tr24_mes<-mean(rowMeans(nonmarkov_tr24_mes_matrix[,1:5], na.rm=T), na.rm=T)
nonmarkov_tr24_cover<-mean(rowMeans(nonmarkov_tr24_cover_matrix[,1:5], na.rm=T), na.rm=T)


nonmarkov_tr25_width_matrix=cbind(width_nonmarkov_t1$tr25_b, width_nonmarkov_t2$tr25_b, width_nonmarkov_t3$tr25_b, width_nonmarkov_t4$tr25_b,
                                  width_nonmarkov_t5$tr25_b)

nonmarkov_tr25_mes_matrix=cbind(width_nonmarkov_t1$tr25_mes, width_nonmarkov_t2$tr25_mes, width_nonmarkov_t3$tr25_mes, width_nonmarkov_t4$tr25_mes,
                                width_nonmarkov_t5$tr25_mes)

nonmarkov_tr25_cover_matrix=cbind(width_nonmarkov_t1$tr25_cover, width_nonmarkov_t2$tr25_cover, width_nonmarkov_t3$tr25_cover, width_nonmarkov_t4$tr25_cover,
                                  width_nonmarkov_t5$tr25_cover)

nonmarkov_tr25_width<-mean(rowMeans(nonmarkov_tr25_width_matrix[,1:5], na.rm=T), na.rm=T)
nonmarkov_tr25_mes<-mean(rowMeans(nonmarkov_tr25_mes_matrix[,1:5], na.rm=T), na.rm=T)
nonmarkov_tr25_cover<-mean(rowMeans(nonmarkov_tr25_cover_matrix[,1:5], na.rm=T), na.rm=T)





nonmarkov_tr34_0_width_matrix=cbind(width_nonmarkov_t1$tr34_0_b, width_nonmarkov_t2$tr34_0_b, width_nonmarkov_t3$tr34_0_b, width_nonmarkov_t4$tr34_0_b,
                                    width_nonmarkov_t5$tr34_0_b)

nonmarkov_tr34_0_mes_matrix=cbind(width_nonmarkov_t1$tr34_0_mes, width_nonmarkov_t2$tr34_0_mes, width_nonmarkov_t3$tr34_0_mes, width_nonmarkov_t4$tr34_0_mes,
                                  width_nonmarkov_t5$tr34_0_mes)

nonmarkov_tr34_0_cover_matrix=cbind(width_nonmarkov_t1$tr34_0_cover, width_nonmarkov_t2$tr34_0_cover, width_nonmarkov_t3$tr34_0_cover, width_nonmarkov_t4$tr34_0_cover,
                                    width_nonmarkov_t5$tr34_0_cover)

nonmarkov_tr34_0_width<-mean(c(rowMeans(nonmarkov_tr34_0_width_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr34_0_mes<-mean(c(rowMeans(nonmarkov_tr34_0_mes_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr34_0_cover<-mean(c(rowMeans(nonmarkov_tr34_0_cover_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr34_1_width_matrix=cbind(width_nonmarkov_t1$tr34_1_b, width_nonmarkov_t2$tr34_1_b, width_nonmarkov_t3$tr34_1_b, width_nonmarkov_t4$tr34_1_b,
                                    width_nonmarkov_t5$tr34_1_b)

nonmarkov_tr34_1_mes_matrix=cbind(width_nonmarkov_t1$tr34_1_mes, width_nonmarkov_t2$tr34_1_mes, width_nonmarkov_t3$tr34_1_mes, width_nonmarkov_t4$tr34_1_mes,
                                  width_nonmarkov_t5$tr34_1_mes)

nonmarkov_tr34_1_cover_matrix=cbind(width_nonmarkov_t1$tr34_1_cover, width_nonmarkov_t2$tr34_1_cover, width_nonmarkov_t3$tr34_1_cover, width_nonmarkov_t4$tr34_1_cover,
                                    width_nonmarkov_t5$tr34_1_cover)

nonmarkov_tr34_1_width<-mean(c(rowMeans(nonmarkov_tr34_1_width_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr34_1_mes<-mean(c(rowMeans(nonmarkov_tr34_1_mes_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr34_1_cover<-mean(c(rowMeans(nonmarkov_tr34_1_cover_matrix[,1:5], na.rm=T)), na.rm=T)


nonmarkov_tr35_0_width_matrix=cbind(width_nonmarkov_t1$tr35_0_b, width_nonmarkov_t2$tr35_0_b, width_nonmarkov_t3$tr35_0_b, width_nonmarkov_t4$tr35_0_b,
                                    width_nonmarkov_t5$tr35_0_b)

nonmarkov_tr35_0_mes_matrix=cbind(width_nonmarkov_t1$tr35_0_mes, width_nonmarkov_t2$tr35_0_mes, width_nonmarkov_t3$tr35_0_mes, width_nonmarkov_t4$tr35_0_mes,
                                  width_nonmarkov_t5$tr35_0_mes)

nonmarkov_tr35_0_cover_matrix=cbind(width_nonmarkov_t1$tr35_0_cover, width_nonmarkov_t2$tr35_0_cover, width_nonmarkov_t3$tr35_0_cover, width_nonmarkov_t4$tr35_0_cover,
                                    width_nonmarkov_t5$tr35_0_cover)

nonmarkov_tr35_0_width<-mean(c(rowMeans(nonmarkov_tr35_0_width_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr35_0_mes<-mean(c(rowMeans(nonmarkov_tr35_0_mes_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr35_0_cover<-mean(c(rowMeans(nonmarkov_tr35_0_cover_matrix[,1:5], na.rm=T)), na.rm=T)



nonmarkov_tr35_1_width_matrix=cbind(width_nonmarkov_t1$tr35_1_b, width_nonmarkov_t2$tr35_1_b, width_nonmarkov_t3$tr35_1_b, width_nonmarkov_t4$tr35_1_b,
                                    width_nonmarkov_t5$tr35_1_b)

nonmarkov_tr35_1_mes_matrix=cbind(width_nonmarkov_t1$tr35_1_mes, width_nonmarkov_t2$tr35_1_mes, width_nonmarkov_t3$tr35_1_mes, width_nonmarkov_t4$tr35_1_mes,
                                  width_nonmarkov_t5$tr35_1_mes)

nonmarkov_tr35_1_cover_matrix=cbind(width_nonmarkov_t1$tr35_1_cover, width_nonmarkov_t2$tr35_1_cover, width_nonmarkov_t3$tr35_1_cover, width_nonmarkov_t4$tr35_1_cover,
                                    width_nonmarkov_t5$tr35_1_cover)

nonmarkov_tr35_1_width<-mean(c(rowMeans(nonmarkov_tr35_1_width_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr35_1_mes<-mean(c(rowMeans(nonmarkov_tr35_1_mes_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr35_1_cover<-mean(c(rowMeans(nonmarkov_tr35_1_cover_matrix[,1:5], na.rm=T)), na.rm=T)



nonmarkov_tr45_0_width_matrix=cbind(width_nonmarkov_t1$tr45_0_b, width_nonmarkov_t2$tr45_0_b, width_nonmarkov_t3$tr45_0_b, width_nonmarkov_t4$tr45_0_b,
                                    width_nonmarkov_t5$tr45_0_b)

nonmarkov_tr45_0_mes_matrix=cbind(width_nonmarkov_t1$tr45_0_mes, width_nonmarkov_t2$tr45_0_mes, width_nonmarkov_t3$tr45_0_mes, width_nonmarkov_t4$tr45_0_mes,
                                  width_nonmarkov_t5$tr45_0_mes)

nonmarkov_tr45_0_cover_matrix=cbind(width_nonmarkov_t1$tr45_0_cover, width_nonmarkov_t2$tr45_0_cover, width_nonmarkov_t3$tr45_0_cover, width_nonmarkov_t4$tr45_0_cover,
                                    width_nonmarkov_t5$tr45_0_cover)

nonmarkov_tr45_0_width<-mean(c(rowMeans(nonmarkov_tr45_0_width_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr45_0_mes<-mean(c(rowMeans(nonmarkov_tr45_0_mes_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr45_0_cover<-mean(c(rowMeans(nonmarkov_tr45_0_cover_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr45_1_width_matrix=cbind(width_nonmarkov_t1$tr45_1_b, width_nonmarkov_t2$tr45_1_b, width_nonmarkov_t3$tr45_1_b, width_nonmarkov_t4$tr45_1_b,
                                    width_nonmarkov_t5$tr45_1_b)

nonmarkov_tr45_1_mes_matrix=cbind(width_nonmarkov_t1$tr45_1_mes, width_nonmarkov_t2$tr45_1_mes, width_nonmarkov_t3$tr45_1_mes, width_nonmarkov_t4$tr45_1_mes,
                                  width_nonmarkov_t5$tr45_1_mes)

nonmarkov_tr45_1_cover_matrix=cbind(width_nonmarkov_t1$tr45_1_cover, width_nonmarkov_t2$tr45_1_cover, width_nonmarkov_t3$tr45_1_cover, width_nonmarkov_t4$tr45_1_cover,
                                    width_nonmarkov_t5$tr45_1_cover)

nonmarkov_tr45_1_width<-mean(c(rowMeans(nonmarkov_tr45_1_width_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr45_1_mes<-mean(c(rowMeans(nonmarkov_tr45_1_mes_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr45_1_cover<-mean(c(rowMeans(nonmarkov_tr45_1_cover_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr45_2_width_matrix=cbind(width_nonmarkov_t1$tr45_2_b, width_nonmarkov_t2$tr45_2_b, width_nonmarkov_t3$tr45_2_b, width_nonmarkov_t4$tr45_2_b,
                                    width_nonmarkov_t5$tr45_2_b)

nonmarkov_tr45_2_mes_matrix=cbind(width_nonmarkov_t1$tr45_2_mes, width_nonmarkov_t2$tr45_2_mes, width_nonmarkov_t3$tr45_2_mes, width_nonmarkov_t4$tr45_2_mes,
                                  width_nonmarkov_t5$tr45_2_mes)

nonmarkov_tr45_2_cover_matrix=cbind(width_nonmarkov_t1$tr45_2_cover, width_nonmarkov_t2$tr45_2_cover, width_nonmarkov_t3$tr45_2_cover, width_nonmarkov_t4$tr45_2_cover,
                                    width_nonmarkov_t5$tr45_2_cover)

nonmarkov_tr45_2_width<-mean(c(rowMeans(nonmarkov_tr45_2_width_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr45_2_mes<-mean(c(rowMeans(nonmarkov_tr45_2_mes_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr45_2_cover<-mean(c(rowMeans(nonmarkov_tr45_2_cover_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr45_12_width_matrix=cbind(width_nonmarkov_t1$tr45_12_b, width_nonmarkov_t2$tr45_12_b, width_nonmarkov_t3$tr45_12_b, width_nonmarkov_t4$tr45_12_b,
                                     width_nonmarkov_t5$tr45_12_b)

nonmarkov_tr45_12_mes_matrix=cbind(width_nonmarkov_t1$tr45_12_mes, width_nonmarkov_t2$tr45_12_mes, width_nonmarkov_t3$tr45_12_mes, width_nonmarkov_t4$tr45_12_mes,
                                   width_nonmarkov_t5$tr45_12_mes)

nonmarkov_tr45_12_cover_matrix=cbind(width_nonmarkov_t1$tr45_12_cover, width_nonmarkov_t2$tr45_12_cover, width_nonmarkov_t3$tr45_12_cover, width_nonmarkov_t4$tr45_12_cover,
                                     width_nonmarkov_t5$tr45_12_cover)

nonmarkov_tr45_12_width<-mean(c(rowMeans(nonmarkov_tr45_12_width_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr45_12_mes<-mean(c(rowMeans(nonmarkov_tr45_12_mes_matrix[,1:5], na.rm=T)), na.rm=T)
nonmarkov_tr45_12_cover<-mean(c(rowMeans(nonmarkov_tr45_12_cover_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr12_power_matrix=cbind(width_nonmarkov_t1$tr12_power, width_nonmarkov_t2$tr12_power, width_nonmarkov_t3$tr12_power, width_nonmarkov_t4$tr12_power,
                               width_nonmarkov_t5$tr12_power)
nonmarkov_tr12_power<-mean(c(rowMeans(nonmarkov_tr12_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr13_power_matrix=cbind(width_nonmarkov_t1$tr13_power, width_nonmarkov_t2$tr13_power, width_nonmarkov_t3$tr13_power, width_nonmarkov_t4$tr13_power,
                               width_nonmarkov_t5$tr13_power)
nonmarkov_tr13_power<-mean(c(rowMeans(nonmarkov_tr13_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr14_power_matrix=cbind(width_nonmarkov_t1$tr14_power, width_nonmarkov_t2$tr14_power, width_nonmarkov_t3$tr14_power, width_nonmarkov_t4$tr14_power,
                               width_nonmarkov_t5$tr14_power)
nonmarkov_tr14_power<-mean(c(rowMeans(nonmarkov_tr14_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr15_power_matrix=cbind(width_nonmarkov_t1$tr15_power, width_nonmarkov_t2$tr15_power, width_nonmarkov_t3$tr15_power, width_nonmarkov_t4$tr15_power,
                               width_nonmarkov_t5$tr15_power)
nonmarkov_tr15_power<-mean(c(rowMeans(nonmarkov_tr15_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr23_power_matrix=cbind(width_nonmarkov_t1$tr23_power, width_nonmarkov_t2$tr23_power, width_nonmarkov_t3$tr23_power, width_nonmarkov_t4$tr23_power,
                               width_nonmarkov_t5$tr23_power)
nonmarkov_tr23_power<-mean(c(rowMeans(nonmarkov_tr23_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr24_power_matrix=cbind(width_nonmarkov_t1$tr24_power, width_nonmarkov_t2$tr24_power, width_nonmarkov_t3$tr24_power, width_nonmarkov_t4$tr24_power,
                               width_nonmarkov_t5$tr24_power)
nonmarkov_tr24_power<-mean(c(rowMeans(nonmarkov_tr24_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr25_power_matrix=cbind(width_nonmarkov_t1$tr25_power, width_nonmarkov_t2$tr25_power, width_nonmarkov_t3$tr25_power, width_nonmarkov_t4$tr25_power,
                               width_nonmarkov_t5$tr25_power)
nonmarkov_tr25_power<-mean(c(rowMeans(nonmarkov_tr25_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr34_0_power_matrix=cbind(width_nonmarkov_t1$tr34_0_power, width_nonmarkov_t2$tr34_0_power, width_nonmarkov_t3$tr34_0_power, width_nonmarkov_t4$tr34_0_power,
                                 width_nonmarkov_t5$tr34_0_power)
nonmarkov_tr34_0_power<-mean(c(rowMeans(nonmarkov_tr34_0_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr34_1_power_matrix=cbind(width_nonmarkov_t1$tr34_1_power, width_nonmarkov_t2$tr34_1_power, width_nonmarkov_t3$tr34_1_power, width_nonmarkov_t4$tr34_1_power,
                                 width_nonmarkov_t5$tr34_1_power)
nonmarkov_tr34_1_power<-mean(c(rowMeans(nonmarkov_tr34_1_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr35_0_power_matrix=cbind(width_nonmarkov_t1$tr35_0_power, width_nonmarkov_t2$tr35_0_power, width_nonmarkov_t3$tr35_0_power, width_nonmarkov_t4$tr35_0_power,
                                 width_nonmarkov_t5$tr35_0_power)
nonmarkov_tr35_0_power<-mean(c(rowMeans(nonmarkov_tr35_0_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr35_1_power_matrix=cbind(width_nonmarkov_t1$tr35_1_power, width_nonmarkov_t2$tr35_1_power, width_nonmarkov_t3$tr35_1_power, width_nonmarkov_t4$tr35_1_power,
                                 width_nonmarkov_t5$tr35_1_power)
nonmarkov_tr35_1_power<-mean(c(rowMeans(nonmarkov_tr35_1_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr45_0_power_matrix=cbind(width_nonmarkov_t1$tr45_0_power, width_nonmarkov_t2$tr45_0_power, width_nonmarkov_t3$tr45_0_power, width_nonmarkov_t4$tr45_0_power,
                                 width_nonmarkov_t5$tr45_0_power)
nonmarkov_tr45_0_power<-mean(c(rowMeans(nonmarkov_tr45_0_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr45_1_power_matrix=cbind(width_nonmarkov_t1$tr45_1_power, width_nonmarkov_t2$tr45_1_power, width_nonmarkov_t3$tr45_1_power, width_nonmarkov_t4$tr45_1_power,
                                 width_nonmarkov_t5$tr45_1_power)
nonmarkov_tr45_1_power<-mean(c(rowMeans(nonmarkov_tr45_1_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr45_2_power_matrix=cbind(width_nonmarkov_t1$tr45_2_power, width_nonmarkov_t2$tr45_2_power, width_nonmarkov_t3$tr45_2_power, width_nonmarkov_t4$tr45_2_power,
                                 width_nonmarkov_t5$tr45_2_power)
nonmarkov_tr45_2_power<-mean(c(rowMeans(nonmarkov_tr45_2_power_matrix[,1:5], na.rm=T)), na.rm=T)

nonmarkov_tr45_12_power_matrix=cbind(width_nonmarkov_t1$tr45_12_power, width_nonmarkov_t2$tr45_12_power, width_nonmarkov_t3$tr45_12_power, width_nonmarkov_t4$tr45_12_power,
                                  width_nonmarkov_t5$tr45_12_power)
nonmarkov_tr45_12_power<-mean(c(rowMeans(nonmarkov_tr45_12_power_matrix[,1:5], na.rm=T)), na.rm=T)




##Table 

table_simu=cbind(
  rbind(markov_mes, markov_width, markov_coverage, markov_power),
  rbind(nonmarkov_mes, nonmarkov_width, nonmarkov_coverage, nonmarkov_power)
)



##Figure. the tr width, mes, and coverage by each transition rate

tr_width<-rbind(
  cbind(markov_tr12_width, markov_tr13_width, markov_tr14_width, markov_tr15_width, markov_tr23_width,
        markov_tr24_width, markov_tr25_width, markov_tr34_0_width, markov_tr35_0_width, markov_tr34_1_width, markov_tr35_1_width, markov_tr45_0_width,markov_tr45_1_width,markov_tr45_2_width,markov_tr45_12_width),
  cbind(nonmarkov_tr12_width, nonmarkov_tr13_width, nonmarkov_tr14_width, nonmarkov_tr15_width, nonmarkov_tr23_width,
        nonmarkov_tr24_width, nonmarkov_tr25_width, nonmarkov_tr34_0_width, nonmarkov_tr35_0_width, nonmarkov_tr34_1_width, nonmarkov_tr35_1_width, nonmarkov_tr45_0_width,nonmarkov_tr45_1_width,nonmarkov_tr45_2_width,nonmarkov_tr45_12_width)
)

tr_mes<-rbind(
  cbind(markov_tr12_mes, markov_tr13_mes, markov_tr14_mes, markov_tr15_mes, markov_tr23_mes,
        markov_tr24_mes, markov_tr25_mes, markov_tr34_0_mes, markov_tr35_0_mes, markov_tr34_1_mes, markov_tr35_1_mes, markov_tr45_0_mes,markov_tr45_1_mes,markov_tr45_2_mes,markov_tr45_12_mes),
  cbind(nonmarkov_tr12_mes, nonmarkov_tr13_mes, nonmarkov_tr14_mes, nonmarkov_tr15_mes, nonmarkov_tr23_mes,
        nonmarkov_tr24_mes, nonmarkov_tr25_mes, nonmarkov_tr34_0_mes, nonmarkov_tr35_0_mes, nonmarkov_tr34_1_mes, nonmarkov_tr35_1_mes, nonmarkov_tr45_0_mes,nonmarkov_tr45_1_mes,nonmarkov_tr45_2_mes,nonmarkov_tr45_12_mes)
)

tr_cover<-rbind(
  cbind(markov_tr12_cover, markov_tr13_cover, markov_tr14_cover, markov_tr15_cover, markov_tr23_cover,
        markov_tr24_cover, markov_tr25_cover, markov_tr34_0_cover, markov_tr35_0_cover, markov_tr34_1_cover, markov_tr35_1_cover, markov_tr45_0_cover,markov_tr45_1_cover,markov_tr45_2_cover,markov_tr45_12_cover),
  cbind(nonmarkov_tr12_cover, nonmarkov_tr13_cover, nonmarkov_tr14_cover, nonmarkov_tr15_cover, nonmarkov_tr23_cover,
        nonmarkov_tr24_cover, nonmarkov_tr25_cover, nonmarkov_tr34_0_cover, nonmarkov_tr35_0_cover, nonmarkov_tr34_1_cover, nonmarkov_tr35_1_cover, nonmarkov_tr45_0_cover,nonmarkov_tr45_1_cover,nonmarkov_tr45_2_cover,nonmarkov_tr45_12_cover)
)

tr_power<-rbind(
  cbind(markov_tr12_power, markov_tr13_power, markov_tr14_power, markov_tr15_power, markov_tr23_power,
        markov_tr24_power, markov_tr25_power, markov_tr34_0_power, markov_tr35_0_power, markov_tr34_1_power, markov_tr35_1_power, markov_tr45_0_power,markov_tr45_1_power,markov_tr45_2_power,markov_tr45_12_power),
  cbind(nonmarkov_tr12_power, nonmarkov_tr13_power, nonmarkov_tr14_power, nonmarkov_tr15_power, nonmarkov_tr23_power,
        nonmarkov_tr24_power, nonmarkov_tr25_power, nonmarkov_tr34_0_power, nonmarkov_tr35_0_power, nonmarkov_tr34_1_power, nonmarkov_tr35_1_power, nonmarkov_tr45_0_power,nonmarkov_tr45_1_power,nonmarkov_tr45_2_power,nonmarkov_tr45_12_power)
)



write.table(table_simu,"./a.R2.summary.results.txt")

write.table(tr_mes,"./a.R2.by.tr.mes.txt")
write.table(tr_width,"./a.R2.by.tr.width.txt")
write.table(tr_cover*100,"./a.R2.by.tr.cover.txt")
write.table(tr_power*100,"./a.R2.by.tr.power.txt")




tr_mes_w=(tr_mes[,1]+tr_mes[,2]+tr_mes[,3]+tr_mes[,4]+tr_mes[,5]+tr_mes[,6]+tr_mes[,7]+(tr_mes[,8]+tr_mes[,10])/2+(tr_mes[,9]+tr_mes[,11])/2+(tr_mes[,12]+tr_mes[,13]+tr_mes[,14]+tr_mes[,15])/4)/10

tr_width_w=(tr_width[,1]+tr_width[,2]+tr_width[,3]+tr_width[,4]+tr_width[,5]+tr_width[,6]+tr_width[,7]+(tr_width[,8]+tr_width[,10])/2+(tr_width[,9]+tr_width[,11])/2+(tr_width[,12]+tr_width[,13]+tr_width[,14]+tr_width[,15])/4)/10

tr_cover_w=(tr_cover[,1]+tr_cover[,2]+tr_cover[,3]+tr_cover[,4]+tr_cover[,5]+tr_cover[,6]+tr_cover[,7]+(tr_cover[,8]+tr_cover[,10])/2+(tr_cover[,9]+tr_cover[,11])/2+(tr_cover[,12]+tr_cover[,13]+tr_cover[,14]+tr_cover[,15])/4)/10

tr_power_w=(tr_power[,1]+tr_power[,2]+tr_power[,3]+tr_power[,4]+tr_power[,5]+tr_power[,6]+tr_power[,7]+(tr_power[,8]+tr_power[,10])/2+(tr_power[,9]+tr_power[,11])/2+(tr_power[,12]+tr_power[,13]+tr_power[,14]+tr_power[,15])/4)/10

table_simu_w=rbind(t(tr_mes_w),t(tr_width_w),t(tr_cover_w),t(tr_power_w))

colnames(table_simu_w)=c("V1","V2")
rownames(table_simu_w)=c("mes","width","cover","power")

write.table(table_simu_w,"./a.R2.summary.results.weighted.txt")


break_interval=0.1
fup_time=1.5

##parameters


z = NULL 
beta=0 
eff=0

r01=0.2
r02=0.3
r03=0.3
r04=0.2

r12=0.4
r13=0.3
r14=0.3

r23_0_1=0.5
r24_0_1=0.6

r23_0=0.1
r24_0=0.2

r34_0=0.2
r34_01=0.3
r34_02=0.6
r34_012=0.9



##from state 0

nsit=4 
dist.ev=c("weibull","weibull","weibull","weibull")
anc.ev=c(1, 1, 1, 1)  ##anc.ev is the shape
beta0.ev=c(-log(r01),-log(r02),-log(r03),-log(r04))  ##beta0.ev is the scale, 1/rate 


a.ev   <- vector()
b.ev   <- vector()
cshaz  <- list()


for (k in 1:nsit)
{
  if (dist.ev[k] == "weibull") {
    a.ev[k] <- beta0.ev[k] 
    b.ev[k] <- anc.ev[k]
    cshaz[[k]] <- function(t, r) {
      par1 <- eval(parse(text="a.ev[r]"))
      par2 <- eval(parse(text="b.ev[r]"))
      return(((1/par2)/((exp(par1))^(1/par2)))*t^((1/par2) - 1))}
  }
}

##compare to ch01 1-25

true0_1234=rbind(
  cshaz[[1]](t=fup_time*1/5,r=1),  
  cshaz[[1]](t=fup_time*2/5,r=1),  
  cshaz[[1]](t=fup_time*3/5,r=1),  
  cshaz[[1]](t=fup_time*4/5,r=1),  
  cshaz[[1]](t=fup_time*5/5,r=1),  
  
  cshaz[[1]](t=fup_time*1/5,r=2),  
  cshaz[[1]](t=fup_time*2/5,r=2),  
  cshaz[[1]](t=fup_time*3/5,r=2),  
  cshaz[[1]](t=fup_time*4/5,r=2),  
  cshaz[[1]](t=fup_time*5/5,r=2),  
  
  cshaz[[1]](t=fup_time*1/5,r=3),  
  cshaz[[1]](t=fup_time*2/5,r=3),  
  cshaz[[1]](t=fup_time*3/5,r=3),  
  cshaz[[1]](t=fup_time*4/5,r=3),  
  cshaz[[1]](t=fup_time*5/5,r=3),  
  
  cshaz[[1]](t=fup_time*1/5,r=4),  
  cshaz[[1]](t=fup_time*2/5,r=4),  
  cshaz[[1]](t=fup_time*3/5,r=4),  
  cshaz[[1]](t=fup_time*4/5,r=4),  
  cshaz[[1]](t=fup_time*5/5,r=4)  
)


##from state 1

nsit=3 
dist.ev=c("weibull","weibull","weibull")
anc.ev=c(1,1,1)  ##anc.ev is the shape
beta0.ev=c(-log(r12), -log(r13), -log(r14)) ##beta0.ev is the scale, 1/rate 


a.ev   <- vector()
b.ev   <- vector()
cshaz  <- list()


for (k in 1:nsit)
{
  if (dist.ev[k] == "weibull") {
    a.ev[k] <- beta0.ev[k] 
    b.ev[k] <- anc.ev[k]
    cshaz[[k]] <- function(t, r) {
      par1 <- eval(parse(text="a.ev[r]"))
      par2 <- eval(parse(text="b.ev[r]"))
      return(((1/par2)/((exp(par1))^(1/par2)))*t^((1/par2) - 1))}
  }
}

##compare to ch01 1-25

true1_234=rbind(
  cshaz[[1]](t=fup_time*1/5,r=1),  
  cshaz[[1]](t=fup_time*2/5,r=1),  
  cshaz[[1]](t=fup_time*3/5,r=1),  
  cshaz[[1]](t=fup_time*4/5,r=1),  
  cshaz[[1]](t=fup_time*5/5,r=1),  
  
  cshaz[[1]](t=fup_time*1/5,r=2),  
  cshaz[[1]](t=fup_time*2/5,r=2),  
  cshaz[[1]](t=fup_time*3/5,r=2),  
  cshaz[[1]](t=fup_time*4/5,r=2),  
  cshaz[[1]](t=fup_time*5/5,r=2),  
  
  cshaz[[1]](t=fup_time*1/5,r=3),  
  cshaz[[1]](t=fup_time*2/5,r=3),  
  cshaz[[1]](t=fup_time*3/5,r=3),  
  cshaz[[1]](t=fup_time*4/5,r=3),  
  cshaz[[1]](t=fup_time*5/5,r=3)  
  
  
  
)




##from state 2_0

nsit=2 
dist.ev=c("weibull","weibull")
anc.ev=c(1,1)  ##anc.ev is the shape
beta0.ev=c(-log(r23_0), -log(r24_0)) ##beta0.ev is the scale, 1/rate 


a.ev   <- vector()
b.ev   <- vector()
cshaz  <- list()


for (k in 1:nsit)
{
  if (dist.ev[k] == "weibull") {
    a.ev[k] <- beta0.ev[k] 
    b.ev[k] <- anc.ev[k]
    cshaz[[k]] <- function(t, r) {
      par1 <- eval(parse(text="a.ev[r]"))
      par2 <- eval(parse(text="b.ev[r]"))
      return(((1/par2)/((exp(par1))^(1/par2)))*t^((1/par2) - 1))}
  }
}

##compare to ch01 1-25

true2_34_0=rbind(
  cshaz[[1]](t=fup_time*1/5,r=1),  
  cshaz[[1]](t=fup_time*2/5,r=1),  
  cshaz[[1]](t=fup_time*3/5,r=1),  
  cshaz[[1]](t=fup_time*4/5,r=1),  
  cshaz[[1]](t=fup_time*5/5,r=1),  
  
  cshaz[[1]](t=fup_time*1/5,r=2),  
  cshaz[[1]](t=fup_time*2/5,r=2),  
  cshaz[[1]](t=fup_time*3/5,r=2),  
  cshaz[[1]](t=fup_time*4/5,r=2),  
  cshaz[[1]](t=fup_time*5/5,r=2)  
  
)



##state 2 from state 01

nsit=2 
dist.ev=c("weibull","weibull")
anc.ev=c(1,1)  ##anc.ev is the shape
beta0.ev=c(-log(r23_0_1), -log(r24_0_1)) ##beta0.ev is the scale, 1/rate 


a.ev   <- vector()
b.ev   <- vector()
cshaz  <- list()


for (k in 1:nsit)
{
  if (dist.ev[k] == "weibull") {
    a.ev[k] <- beta0.ev[k] 
    b.ev[k] <- anc.ev[k]
    cshaz[[k]] <- function(t, r) {
      par1 <- eval(parse(text="a.ev[r]"))
      par2 <- eval(parse(text="b.ev[r]"))
      return(((1/par2)/((exp(par1))^(1/par2)))*t^((1/par2) - 1))}
  }
}

##compare to ch01 1-25

true2_34_01=rbind(
  cshaz[[1]](t=fup_time*1/5,r=1),  
  cshaz[[1]](t=fup_time*2/5,r=1),  
  cshaz[[1]](t=fup_time*3/5,r=1),  
  cshaz[[1]](t=fup_time*4/5,r=1),  
  cshaz[[1]](t=fup_time*5/5,r=1),  
  
  cshaz[[1]](t=fup_time*1/5,r=2),  
  cshaz[[1]](t=fup_time*2/5,r=2),  
  cshaz[[1]](t=fup_time*3/5,r=2),  
  cshaz[[1]](t=fup_time*4/5,r=2),  
  cshaz[[1]](t=fup_time*5/5,r=2)  
  
)




##from state 3

nsit=1
dist.ev=c("weibull")
anc.ev=c(1)  ##anc.ev is the shape
beta0.ev=c(-log(r34_0)) ##beta0.ev is the scale, 1/rate 

a.ev   <- vector()
b.ev   <- vector()
cshaz  <- list()


for (k in 1:nsit)
{
  if (dist.ev[k] == "weibull") {
    a.ev[k] <- beta0.ev[k] 
    b.ev[k] <- anc.ev[k]
    cshaz[[k]] <- function(t, r) {
      par1 <- eval(parse(text="a.ev[r]"))
      par2 <- eval(parse(text="b.ev[r]"))
      return(((1/par2)/((exp(par1))^(1/par2)))*t^((1/par2) - 1))}
  }
}

##compare to ch01 1-25

true3_4_0=rbind(
  cshaz[[1]](t=fup_time*1/5,r=1),  
  cshaz[[1]](t=fup_time*2/5,r=1),  
  cshaz[[1]](t=fup_time*3/5,r=1),  
  cshaz[[1]](t=fup_time*4/5,r=1),  
  cshaz[[1]](t=fup_time*5/5,r=1)  
  
  
)

#####

nsit=1
dist.ev=c("weibull")
anc.ev=c(1)  ##anc.ev is the shape
beta0.ev=c(-log(r34_01))

a.ev   <- vector()
b.ev   <- vector()
cshaz  <- list()


for (k in 1:nsit)
{
  if (dist.ev[k] == "weibull") {
    a.ev[k] <- beta0.ev[k] 
    b.ev[k] <- anc.ev[k]
    cshaz[[k]] <- function(t, r) {
      par1 <- eval(parse(text="a.ev[r]"))
      par2 <- eval(parse(text="b.ev[r]"))
      return(((1/par2)/((exp(par1))^(1/par2)))*t^((1/par2) - 1))}
  }
}

##compare to ch01 1-25

true3_4_01=rbind(
  cshaz[[1]](t=fup_time*1/5,r=1),  
  cshaz[[1]](t=fup_time*2/5,r=1),  
  cshaz[[1]](t=fup_time*3/5,r=1),  
  cshaz[[1]](t=fup_time*4/5,r=1),  
  cshaz[[1]](t=fup_time*5/5,r=1)  
  
  
)

#####

nsit=1
dist.ev=c("weibull")
anc.ev=c(1)  ##anc.ev is the shape
beta0.ev=c(-log(r34_02)) ##beta0.ev is the scale, 1/rate 

a.ev   <- vector()
b.ev   <- vector()
cshaz  <- list()


for (k in 1:nsit)
{
  if (dist.ev[k] == "weibull") {
    a.ev[k] <- beta0.ev[k] 
    b.ev[k] <- anc.ev[k]
    cshaz[[k]] <- function(t, r) {
      par1 <- eval(parse(text="a.ev[r]"))
      par2 <- eval(parse(text="b.ev[r]"))
      return(((1/par2)/((exp(par1))^(1/par2)))*t^((1/par2) - 1))}
  }
}

##compare to ch01 1-25

true3_4_02=rbind(
  cshaz[[1]](t=fup_time*1/5,r=1),  
  cshaz[[1]](t=fup_time*2/5,r=1),  
  cshaz[[1]](t=fup_time*3/5,r=1),  
  cshaz[[1]](t=fup_time*4/5,r=1),  
  cshaz[[1]](t=fup_time*5/5,r=1)  
  
)


#####

nsit=1
dist.ev=c("weibull")
anc.ev=c(1)  ##anc.ev is the shape
beta0.ev=c(-log(r34_012))

a.ev   <- vector()
b.ev   <- vector()
cshaz  <- list()


for (k in 1:nsit)
{
  if (dist.ev[k] == "weibull") {
    a.ev[k] <- beta0.ev[k] 
    b.ev[k] <- anc.ev[k]
    cshaz[[k]] <- function(t, r) {
      par1 <- eval(parse(text="a.ev[r]"))
      par2 <- eval(parse(text="b.ev[r]"))
      return(((1/par2)/((exp(par1))^(1/par2)))*t^((1/par2) - 1))}
  }
}

##compare to ch01 1-25

true3_4_012=rbind(
  cshaz[[1]](t=fup_time*1/5,r=1),  
  cshaz[[1]](t=fup_time*2/5,r=1),  
  cshaz[[1]](t=fup_time*3/5,r=1),  
  cshaz[[1]](t=fup_time*4/5,r=1),  
  cshaz[[1]](t=fup_time*5/5,r=1)  
  
)

true_non_markov_exp=t(rbind(
true0_1234[1:5,],
true0_1234[6:10,],
true0_1234[11:15,],
true0_1234[16:20,],

true1_234[1:5,],
true1_234[6:10,],
true1_234[11:15,],

true2_34_0[1:5,],
true2_34_0[6:10,],

true2_34_01[1:5,],
true2_34_01[6:10,],

true3_4_0[1:5,],
true3_4_01[1:5,],
true3_4_02[1:5,],
true3_4_012[1:5,]
)
)
colnames(true_non_markov_exp)=cbind("s1", "s2", "s3","s4", 
                                         "s12", "s13", "s14", 
                                         "s23_0","s24_0", "s23_01",  "s24_01",
                                    "s34_0","s34_01", "s34_02", "s34_012")

rownames(true_non_markov_exp)=cbind("t1","t2","t3","t4","t5")

write.table(true_non_markov_exp, 
            "./true_non_markov_exp.txt")

##Author of R code: Ming Ding

##Citation: Ming Ding, Haiyi Chen, Feng-Chang Lin, "A Multi-state Non-Markov Framework to Estimate Progression of Chronic Disease", which is available at https://www.medrxiv.org/content/10.1101/2024.02.15.24302901v1.full.pdf.

Step 1. Calculate theortical parameters used for simulation
##Theortical_data_markov.R
##Theortical_data_semimarkov.R
##Theortical_data_nonmarkov.R

Step 2. Simulate multi-state data
##simu.data.markov.R
##simu.data.nonmarkov.R
##simu.data.semimarkov.R 

Step 3. Estimate transition parameters using our multi-state modeling framework
##simu.model.markov.R
##simu.model.nonmarkov.R
##simu.model.semimarkov.R 

Step 4. Compare estimated to theortical parameters to obtain coverage, 95% CI, and MSE.
##simu.comparison.R



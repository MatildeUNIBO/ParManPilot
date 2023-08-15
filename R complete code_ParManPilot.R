#...............................................................................

##Analyses for the manuscript
##Echinococcus multilocularis infection affects risk-taking behaviours in Microtus arvalis: adaptive manipulation?

#...............................................................................
#SUMMARY OF THE SCRIPT: 1) Behavioral observation and tests analysis 
#                       2) Fisher's exact Test
#                       3) Parasitological investigation
                    

## 1) For --- Behavioural analyses --- use => BEHAV_OBSERVATION_AND_TESTSdata.xlsx file 

library(readxl)
library(MKinfer)
library(DAAG)
library(ggplot2)

Behaviour <- read_excel("BEHAV_OBSERVATION_AND_TESTSdata.xlsx") 
#...............................................................................

## PREPARATION OF DATA FOR ANALYSES
#...............................................................................

#Data transformation --> TREATMENT from "chr" to "Factor"  
Behaviour$TREATMENT<-as.factor(Behaviour$TREATMENT)

#...............................................................................

 ## BEHAVIORAL OBSERVATION AND TESTS ANALYSIS 
#...............................................................................

## We used nonparametric bootstrap t-test for unpaired group, unbalanced sample size
## and non-normal distribution. This type of test is more robust and powerful 
## with small samples.
## The bootstrap p-value is based on 10,000 bootstrap replications. 
## Significant p-values (P < 0.05). 

# BEHAVIORAL OBSERVATION ---> The voles were observed for 24 hours to assess 
# spontaneous behavior in their home cage

#=== Events and duration in minutes that the animal spends sucking the bottle of water
MD_EV <- boot.t.test(Behaviour$MODRIKEV ~ Behaviour$TREATMENT, 
                     paired = FALSE, var.equal=TRUE, R=10000)
#Not significant

MD <- boot.t.test(Behaviour$MODRINK ~ Behaviour$TREATMENT, 
                  paired = FALSE, var.equal=TRUE, R=10000)
#Not significant 

#=== Events and duration in minutes that the animal chewing the pellet
MF_EV <- boot.t.test(Behaviour$MOFEEDEV ~ Behaviour$TREATMENT, 
                     paired = FALSE, var.equal=TRUE, R=10000)
#Significant

MF <- boot.t.test(Behaviour$MOFEED ~ Behaviour$TREATMENT, 
                  paired = FALSE, var.equal=TRUE, R=10000)
#Not significant

#=== Total duration in hours that the animal spends above bedding
MUP <- boot.t.test(Behaviour$MOUP ~ Behaviour$TREATMENT, 
                   paired = FALSE, var.equal=TRUE, R=10000)
#Significant

#=== Total duration in seconds that the animal spends in the center (unsafe zone) of the arena
OCNT <- boot.t.test(Behaviour$OPCNT ~ Behaviour$TREATMENT, 
                    paired = FALSE, var.equal=TRUE, R=10000)
#Not significant 

#=== Total duration in seconds that the animal spends in the peripheral (safe zone) of the arena
OPR <- boot.t.test(Behaviour$OPPER ~ Behaviour$TREATMENT, 
                   paired = FALSE, var.equal=TRUE, R=10000)
#Not significant 

#=== Events and duration in seconds that the animal spends completely stationary in the two sides of the barrier for at least 1 second
BF_EV <- boot.t.test(Behaviour$BTFREEZEEV ~ Behaviour$TREATMENT, 
                     paired = FALSE, var.equal=TRUE, R=10000)
#Not significant 

BF <- boot.t.test(Behaviour$BTFREEZE ~ Behaviour$TREATMENT, 
                  paired = FALSE, var.equal=TRUE, R=10000)
#Not significant 

#=== Latency (in seconds) to jump over the barrier
BL <- boot.t.test(Behaviour$BTLAT ~ Behaviour$TREATMENT, 
                  paired = FALSE, var.equal=TRUE, R=10000)
#Not significant

#=== Events and duration in seconds that the animal spends using its paws to move the sand
BD_EV <- boot.t.test(Behaviour$BTDIGGEV ~ Behaviour$TREATMENT, 
                     paired = FALSE, var.equal=TRUE, R=10000)
#Not significant

BD <- boot.t.test(Behaviour$BTDIGG ~ Behaviour$TREATMENT, 
                  paired = FALSE, var.equal=TRUE, R=10000)
#Not significant

#=== Latency (in seconds) to hide into the bedding the first time
PL <- boot.t.test(Behaviour$PTLAT ~ Behaviour$TREATMENT, 
                  paired = FALSE, var.equal=TRUE, R=10000)
#Not significant

#=== Events and duration in seconds that the animal spends running into the wheel before the stimulus application
RRB_EV <- boot.t.test(Behaviour$RWRUNBEFEV ~ Behaviour$TREATMENT, 
                      paired = FALSE, var.equal=TRUE, R=10000)
#Not significant

RRB <- boot.t.test(Behaviour$RWRUNBEF ~ Behaviour$TREATMENT, 
                   paired = FALSE, var.equal=TRUE, R=10000)
#Not significant

#=== Duration in seconds of freezing reaction within 1 minute after the stimulus application
RFA <- boot.t.test(Behaviour$RWFREEZEAFT ~ Behaviour$TREATMENT, 
                   paired = FALSE, var.equal=TRUE, R=10000)
#Not significant

# For data visualization and box plots creation (Figure 2 of the Manuscript)

windows(7,8)
par(mfrow=c(1,2))
par(family="Times New Roman")
boxplot(MOFEEDEV ~ TREATMENT, ylab = "Events", xlab=NULL, 
        main = "Eating Events", boxwex=0.4, data = Behaviour, 
        col = c("grey", "white"), outpch = 21, las=1)

boxplot(MOUP ~ TREATMENT, ylab = "Hour/day", xlab=NULL, 
        main = "Time Spent Above Bedding", boxwex=0.4, data = Behaviour, 
        col = c("grey", "white"), outpch = 21, las=1)


## 2) For --- Fisher's exact test ---

#...............................................................................

## PREPARATION OF DATA FOR ANALYSES
#...............................................................................

#Create a contingency table from raw data ---> for the variable "ACTBEF": 
#Presence of spontaneous running into the wheel before the stimulus application

SPORUN <- table(Behaviour$ACTBEF,
                Behaviour$TREATMENT)

#Create a contingency table from raw data ---> for the variable "REACTAFT": 
#Presence of reaction (running) within 3 seconds after the stimulus application

REAFT <- table(Behaviour$REACTAFT, 
                Behaviour$TREATMENT)

#...............................................................................

## FISHER'S EXACT TEST
#...............................................................................

## We used fisher's exact test a Fisher exact test to compare 
## the frequency of infected and uninfected animals 
## that showed spontaneous activity in the wheel, before the application
## of the air puff stimulus, and to compare the frequency 
##of infected and uninfected vole behavioral reaction (running) within 3 seconds 
##after the air puff

test1 <- fisher.test(SPORUN)

test2 <- fisher.test(REAFT)

## 3) For --- Parasitological investigation --- use => PROT_AND_LESION_DETdata.xlsx file

Parasitol <- read_excel("PROT_AND_LESION_DETdata.xlsx")

#...............................................................................

## PREPARATION OF DATA FOR ANALYSES
#...............................................................................

##Elimination of ID animal 379 and 383 (for rationale see the Manuscript)
Prot <- Parasitol[-c(3,6),]

#...............................................................................

## PARASITOLOGICAL INVESTIGATION
#...............................................................................

## We calculated the mean of protoscoleces per animal 
Prot_mean <- mean(Prot$Tot_N_Prot)
## With its Standard Error
Prot_mean_SE <- sd(Tot_N_Prot)/sqrt(length(Tot_N_Prot)) 

## We calculated min and max number of protoscoleces 
min(Prot$Tot_N_Prot) 
max(Prot$Tot_N_Prot)

## We calculated the mean of lesions per animal 
Les_mean <- mean(Prot$Tot_N_Le) 
## With its Standard Error
Les_mean_SE <- sd(Tot_N_Le)/sqrt(length(Tot_N_Le))

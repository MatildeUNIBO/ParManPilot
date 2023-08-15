# ParManPilot
The present repository contains all data and code required to reproduce the results and the graph of:  
Martini, M., Cioli, T., Romig, T., Gagliardo, A., Giunchi, D., Zaccaroni, M. and Massolo, A. *Echinococcus multilocularis* infection affects risk-taking behaviours in *Microtus arvalis*: adaptive manipulation?

## Description of the pilot study:

The overall aim of this pilot study was to preliminarily investigate possible behavioural alterations caused by the parasite *Echinococcus multilocularis* in the common vole (*Microtus arvalis*), one of its key Intermediate Host species in Europe. Specifically, we aimed to obtain the proof of concept to support the hypothesis of parasitic manipulation of Intermediate Host behaviour in *E. multilocularis* so as to facilitate its transmission.

## Description of R SCRIPT file:

The code is organised in one R script file named: "R complete code_ParManPilot.R" to run 3 different analyses:

  1) Behavioral observation and tests analysis
  2) Fisher's exact Test
  3) Parasitological investigation
	
## Description of variables in each DATA file:

There are two main data files from which all analyses can be performed -->

1) Filename = BEHAV_OBSERVATION_AND_TESTSdata.xlsx contains data of anti-predatory behaviour responses of 16 M. arvalis 
(8 males and 8 females) aged between 9 and 14 weeks during behavioural observation and tests.
2) Filename = PROT_AND_LESION_DETdata.xlsx contains data about liver location of parasite larvae and intensity of parasite infection: number of lesions and number of protoscoleces.

-----------------------------------------------------------------------------------------------------------------------------

Filename = BEHAV_OBSERVATION_AND_TESTSdata.xlsx

All information about behavioural responses of each individual during the behavioural observation and tests.

* **ID** = animal identification code.
* **TREATMENT** = experimental group, codes "C" for not infected and "T" for infected with E. multilocularis eggs.
* **TIME** = time (weeks) from the infection, when the behavioural observation and tests started.
* **MODRINK** = duration in minutes that the animal spends sucking the bottle of water, during the behavioural observation.
* **MODRINKEV** = number of events that the animal sucks the bottle of water, during the behavioural observation.
* **MOFEED** = duration in minutes that the animal chewing the pellet, during the behavioural observation.
* **MOFEEDEV** = number of events that the animal chews the pellet, during the behavioural observation.
* **MOUP** = total duration in hours that the animal spends above bedding, during the behavioural observation.
* **OPCNT** = total duration in seconds that the animal spends in the centre (unsafe zone) of the arena, during the Open Field Test.
* **OPPER** = total duration in seconds that the animal spends in the peripheral (safe zone) of the arena, during the Open Field Test.
* **BTLAT** = latency (in seconds) to jump over the barrier, during the Barrier Test.
* **BTDIGG** = duration in seconds that the animal spends using its paws to move the sand, during the Barrier Test.
* **BTDIGGEV** = number of events that the animal uses its paws to move the sand, during the Barrier Test.
* **BTFREEZE** = duration in seconds that the animal spends completely stationary in the two sides of the barrier for at least 1 second, during the Barrier Test.
* **BTFREEZEEV** = number of events that the animal remains completely stationary in the two sides of the barrier for at least 1 second, during the Barrier Test. 
* **PTLAT** = latency (in seconds) to hide into the bedding the first time, during the Platform Test.
* **RWRUNBEF** = duration in seconds that the animal spends running into the wheel before the stimulus application, during the Running wheel and Air Puff Test.
* **RWRUNBEFEV** = number of events that the animal runs into the wheel before the stimulus application, during the Running wheel and Air Puff Test.
* **RWFREEZEAFT** = duration in seconds of freezing reaction within 1 minute after the stimulus application, during the Running wheel and Air Puff Test.
* **ACTBEF** = presence/absence of activity before the stimulus application, codes "1" for presence and "0" for no presence of activity, during the Running wheel and Air Puff Test.
* **REACTAFT** = presence/absence of reaction (running) within 3 seconds after the stimulus application, codes "1" for presence and "0" for no presence of activity, during the Running wheel and Air Puff Test.

-----------------------------------------------------------------------------------------------------------------------------

Filename = PROT_AND_LESION_DETdata.xlsx

All information about parasite development for each individual 

* **ID** = animal identification code.
* **Tot_N_Prot** = total number of protoscoleces larva detected in each animal. 
* **Tot_N_Le** = total number of *E. multilocularis* lesions detected in each animal.
* **LLL_Le** = total number of *E. multilocularis* lesions detected in the Left Lateral Lobe of each animal.
* **LML_Le** = total number of *E. multilocularis* lesions detected in the Left Medial Lobe of each animal.
* **RML_Le** = total number of *E. multilocularis* lesions detected in the Right Medial Lobe of each animal.
* **RLL_Le** = total number of *E. multilocularis* lesions detected in the Right Lateral Lobe of each animal.
* **CL_Le** = total number of *E. multilocularis* lesions detected in the Caudate Lobe of each animal.

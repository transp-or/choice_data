// This file has automatically been generated.
// Thu Jul  5 15:33:17 2001
// Michel Bierlaire, EPFL (c) 2001

[DataFile]
// Specify the number of columns that must be read in the data file
// It is used to check if the data file is read correctly.
$COLUMNS = 29


[Choice]
(  10  *  CHOICE   ) +  SP  

[Beta]
// Name Value  LowerBound UpperBound  status (0=variable, 1=fixed)
ASC_CAR_SP	+2.2678204e-01	-1.0000000e+00	+1.0000000e+00	0
ASC_SBB_SP	+0.0000000e+00	-1.0000000e+00	+1.0000000e+00	1
ASC_SM_SP	+2.0981904e-01	-1.0000000e+00	+1.0000000e+00	0
B_AGE	+6.9396960e-02	-1.0000000e+00	+1.0000000e+00	0
B_CAR_TIME	-2.9036383e-03	-1.0000000e+00	+1.0000000e+00	0
B_COST	-2.4961794e-03	-1.0000000e+00	+1.0000000e+00	0
B_HEADWAY	-7.9076730e-04	-1.0000000e+00	+1.0000000e+00	0
B_GA	+1.3530513e+00	-1.0000000e+00	+5.0000000e+00	0
B_SEATS	+1.5122148e-01	-1.0000000e+00	+1.0000000e+00	0
B_SM_TIME	-2.7050339e-03	-1.0000000e+00	+1.0000000e+00	0
B_TRAIN_TIME	-3.1508394e-03	-1.0000000e+00	+1.0000000e+00	0

[Mu]
// In general, the value of mu must be fixed to 1. For testing purposes, you
// may change its value or let it be estimated.
// Value LowerBound UpperBound Status
+1.0000000e+00	+0.0000000e+00	+1.0000000e+00	1

[Utilities]
// Id Name  Avail  linear-in-parameter expression (beta1*x1 + beta2*x2 + ... )
31	Car_SP	CAR_AV_SP	ASC_CAR_SP * one + B_CAR_TIME * CAR_TT + B_COST * CAR_CO
11	SBB_SP	TRAIN_AV_SP	ASC_SBB_SP * one + B_TRAIN_TIME * TRAIN_TT + B_COST * TRAIN_COST + B_HEADWAY * TRAIN_FR + B_GA * GA + B_AGE * AGE
21	SM_SP	SM_AV	ASC_SM_SP * one + B_SM_TIME * SM_TT + B_COST * SM_COST + B_HEADWAY * SM_FR + B_GA * GA + B_SEATS * SM_SEATS

[Expressions] 
// Define here arithmetic expressions for name that are not directly 
// available from the data
AGE = AGE 
CAR_AV_SP =  CAR_AV   && (  SP   !=  0  )
CAR_CO = CAR_CO 
CAR_TT = CAR_TT 
GA = GA 
LUGGAGE = LUGGAGE 
SM_COST =  SM_CO   * (  GA   ==  0  )
SM_FR = SM_FR 
SM_SEATS = SM_SEATS 
SM_TT = SM_TT 
TRAIN_AV_SP =  TRAIN_AV   && (  SP   !=  0  )
TRAIN_COST =  TRAIN_CO   * (  GA   ==  0  )
TRAIN_FR = TRAIN_FR 
TRAIN_TT = TRAIN_TT 
one = 1


[Exclude]
( SP == 0 ) + (( PURPOSE != 1 ) * (  PURPOSE   !=  3  ))

[Model]
// Currently, the following models are available
// Uncomment exactly one of them
//$MNL  // Multinomial Logit Model
$NL  // Nested Logit Model
//$CNL  // Cross-Nested Logit Model
//$NGEV // Network GEV Model

[Scale]
// The sample can be divided in several groups of individuals. The
//utility of an individual in a group will be multiplied by the scale factor
//associated with the group.

// Group_number  scale LowerBound UpperBound status

+1	+1.0000000e+00	+1.0000000e+00	+1.0000000e+00	1
[NLNests]
// Name paramvalue  LowerBound UpperBound  status list of alt
Car_Rail      1.0      1   10     0         11 31
Sm      1.0      1   10     1         21

[Ratios]
// Numerator Denominator Name
  B_CAR_TIME B_COST   Value_of_car_time
  B_SM_TIME B_COST    Value_of_SM_time
  B_TRAIN_TIME B_COST Value_of_train_time

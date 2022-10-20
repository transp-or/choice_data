// This file has automatically been generated.
// Thu Jun 24 13:01:03 2004
// Michel Bierlaire, EPFL (c) 2001-2004
// // BIOGEME Version 1.0 [Fri May 28 11:29:53 2004]
// Author: Michel Bierlaire, EPFL (2001-2004)
// -- Compiled by Michel Bierlaire on Cygwin

[Choice]
(  10  *  CHOICE   ) +  SP  

[Weight]
$NONE

[PanelData]
// First, the attribute in the file containing the ID of the individual
// Then the list of random parameters which are constant for all 
// observations of the same individual
// The syntax for a random paramter with mean BETA and std err SIGMA is
// BETA_SIGMA
P_NR 
B_CAR_TIME_B_CAR_TIMEstd

[Beta]
// Name Value  LowerBound UpperBound  status (0=variable, 1=fixed)
ASC_CAR_SP	+2.4345585e-01	-3.0000000e+00	+3.0000000e+00	0
ASC_SBB_SP	+0.0000000e+00	-3.0000000e+00	+3.0000000e+00	1
ASC_SM_SP	+4.2753257e-01	-3.0000000e+00	+3.0000000e+00	0
B_AGE	+1.4841583e-01	-3.0000000e+00	+3.0000000e+00	0
B_CAR_TIME	-1.3098990e-02	-3.0000000e+00	+3.0000000e+00	0
B_CAR_TIMEstd	+4.7827208e-03	-3.0000000e+00	+3.0000000e+00	0
B_COST	-8.9282517e-03	-3.0000000e+00	+3.0000000e+00	0
B_GA	+1.2563467e+00	-3.0000000e+00	+5.0000000e+00	0
B_HEADWAY	-5.6095096e-03	-3.0000000e+00	+3.0000000e+00	0
B_SEATS	-3.1056455e-01	-3.0000000e+00	+3.0000000e+00	0
B_SM_TIME	-1.4058540e-02	-3.0000000e+00	+3.0000000e+00	0
B_TRAIN_TIME	-1.8189100e-02	-3.0000000e+00	+3.0000000e+00	0


[Mu]
// In general, the value of mu must be fixed to 1. For testing purposes, you
// may change its value or let it be estimated.
// Value LowerBound UpperBound Status
+1.0000000e+00	+0.0000000e+00	+1.0000000e+00	1

[SampleEnum]
// Number of simulated choices to include in the sample enumeration file
+0

[Utilities]
// Id Name  Avail  linear-in-parameter expression (beta1*x1 + beta2*x2 + ... )
+31	Car_SP	CAR_AV_SP	ASC_CAR_SP * one + B_CAR_TIME [ B_CAR_TIMEstd ]  * CAR_TT + B_COST * CAR_CO
+11	SBB_SP	TRAIN_AV_SP	ASC_SBB_SP * one + B_TRAIN_TIME * TRAIN_TT + B_COST * TRAIN_COST + B_HEADWAY * TRAIN_FR + B_GA * GA + B_AGE * AGE
+21	SM_SP	SM_AV	ASC_SM_SP * one + B_SM_TIME * SM_TT + B_COST * SM_COST + B_HEADWAY * SM_FR + B_GA * GA + B_SEATS * SM_SEATS

[GeneralizedUtilities]
$NONE

[ParameterCovariances]
// Par_i Par_j Value  LowerBound UpperBound  status (0=variable, 1=fixed)
$NONE
[Expressions] 
// Define here arithmetic expressions for name that are not directly 
// available from the data

CAR_AV_SP  =  CAR_AV   && (  SP   !=  0  )
SM_COST  =  SM_CO   * (  GA   ==  0  )
TRAIN_AV_SP  =  TRAIN_AV   && (  SP   !=  0  )
TRAIN_COST  =  TRAIN_CO   * (  GA   ==  0  )
one  = 1

[Draws]
1000

[Exclude]
(  SP   ==  0  ) + ( (  PURPOSE   !=  1  ) * (  PURPOSE   !=  3  ) )

[Model]
// Currently, the following models are available
// Uncomment exactly one of them
//$MNL  // Multinomial Logit Model
//$NL  // Nested Logit Model
$CNL  // Cross-Nested Logit Model
//$NGEV // Network GEV Model

[CNLNests]
// Name paramvalue LowerBound UpperBound  status 
Car_Rail	+2.6727831e+00	+1.0000000e+00	+1.0000000e+01	0
Rail_Sm	+4.6799242e+00	+1.0000000e+00	+1.0000000e+01	0

[CNLAlpha]
// Alt Nest value LowerBound UpperBound  status
Car_SP	Car_Rail	+1.0000000e+00	+9.9999997e-06	+1.0000000e+00	1
SBB_SP	Car_Rail	+5.0000000e-01	+9.9999997e-06	+1.0000000e+00	1
SBB_SP	Rail_Sm	+5.0000000e-01	+9.9999997e-06	+1.0000000e+00	1
SM_SP	Rail_Sm	+1.0000000e+00	+9.9999997e-06	+1.0000000e+00	1

[Ratios] 
// List of ratios of estimated coefficients that must be produced in
// the output. The most typical is the value-of-time.
// Numerator   Denominator  Name
B_SM_TIME	B_COST	Value_of_SM_time
B_CAR_TIME	B_COST	Value_of_car_time
B_TRAIN_TIME	B_COST	Value_of_train_time

[LinearConstraints]
$NONE

[NonLinearEqualityConstraints]
$NONE

[NonLinearInequalityConstraints]
// At this point, BIOGEME is not able to handle nonlinear inequality
// constraints yet. It should be available in a future version.
$NONE

[NetworkGEVNodes] 
// All nodes of the Network GEV model, except the root,
// must be listed here, with their associated parameter.
// If the nodes corresponding to alternatives are not listed,
// the associated parameter is constrained to 1.0 by default
// Name  mu_param_value	LowerBound	UpperBound	status
$NONE

[NetworkGEVLinks]
// There is a line for each link of the network. 
// The root node is denoted by __ROOT
// All other nodes must be either an alternative or a node listed in
// the section [NetworkGEVNodes]
// Note that an alternative cannot be the a-node of any link,
// and the root node cannot be the b-node of any link.
// a-node  b-node alpha_param_value LowerBound UpperBound  status
$NONE

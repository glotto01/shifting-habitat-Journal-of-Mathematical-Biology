# shifting-habitat-Journal-of-Mathematical-Biology
Matlab files for JMB paper Spread and Persistance for IDE with Shifting Habitat and Strong Allee Effect
## setglobal
takes inputs eps, m0 and m1 and where eps is a error tolerance. It then globally sets these parameters, the step size, and dispersal vector. This must be ran first for most of the below functions.
## cstar
has no input arguements. Calculates c(infinity) for the globally set parameters. Uses a fixed point method to numerically approximate the traveling wave.
## plot_tmax
Used to compute population density curves for  the case of hypothesis 2.1. Takes the length of support of initial data, c (habitat speed), number of iteration, and file name as inputs. Outputs a csv file containg x values and respective u values as rows.
## test_d
Used to determine if an initial population with support 0<x<d can survive in the case of hypo. 2.1.  test_d has input arguments d (length of initial support) and c (speed of habitat shift). It returns 1 if the population survives, and 0 if extinction occurs. The criteria for determining survival is an increase in total population for 50 consecutive generations. The criteria for exctinction is u(x)<allee for all x.
## plot_d
this determines the critical initial domain size (dstar) using a bisection method. Inputs are desired accuracy for dstar, and the number of sample points desired for the interval [0, .99cstar]. It outputs a csv file containing the c sample points as one row, and the corresponding dstar as the other row.
## plot_patch
This is used to compute population density curves for a growth function meeting hypothesis 2.3. The inputs are the initial support ([-l,l]), the speed of habitat shift (c), the number of generations and the desired name of the csv output file. The output is a csvfile whose rows are the respective x  and u values for each generation.
## findeq
This iterates the case corresponding to hypo 2.3 until a fixed point condition is met. The initial condition used is u(x)=1 on [-l,l]. the inputs are l (half patch size), c, and tolerance. The output is the x and u vector of the equilibrium. The fixed point condition used is that absilute max. difference of the appropriatley shifted images of the growth functions of consecutive genrations are less than than tolerance.

# shifting-habitat-Journal-of-Mathematical-Biology
Matlab files for JMB paper Spread and Persistance for IDE with Shifting Habitat and Strong Allee Effect
## setglobal
takes inputs eps, m0 and m1 and where eps is a error tolerance. It then globally sets these parameters, the step size, and dispersal vector.
## cstar
has no input arguements. calculates c(infinity) for the globally set parameters. Uses a fixed point method to numerically approximate the traveling wave.
## plot_tmax
takes length of support of initial data, c (habitat speed), number of iteration, and file name as inputs. Outputs a csv file containg x values and respective u values as rows.
##test_d
test_d has input arguments d (length of initial support) and c (speed of habitat shift). It returns 1 if the population survives, and 0 if extinction occurs. The criteria for determining survival is an increase in total population for 50 consecutive generations. The criteria for exctinction is u(x)<allee for all x.
##plot_d
this determines the critical initial domain size (dstar) using a bisection method. Inputs are desired accuracy for dstar, and the number of sample points desired for the interval [0, .99cstar]. It outputs a csv file containing the c sample points as one row, and the corresponding dstar as the other row.
## ?

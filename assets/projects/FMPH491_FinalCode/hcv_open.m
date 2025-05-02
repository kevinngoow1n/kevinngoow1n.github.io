function hcv_open

init_s = 774432; % initial number susceptible
init_i = 1; %initial number infecteds. We are seeding the population with just one person who is in the infected compartment
init_r = 1; %initial number recovered
initconditions = [init_s,init_i,init_r]; %creating a vector of initial conditions.  

tspan=linspace(1850,2030,181); %vector of time span for simulations, see help linspace for this command which creates a linearly spaced vector. 

[T, Y] = ode45(@sir_hcv, tspan, initconditions);

numS = Y(:,1) %number of susceptibles over time
numA = Y(:,2); %number of acute infectious over time
numC = Y(:,3); %number of chronic infectious over time
totN = Y(:,1)+Y(:,2)+Y(:,3); %total population size

propS = numS./totN; %calculating proportion susceptible over time
propA = numA./totN; %calculating proportion infectious  over time
propC = numC./totN; %calculating proportion recovered  over time

beta =0.25; %We need to define beta here because we need this for our incidence calculation. This is the same parameter as in the differential equations code.
incidence = beta.*numS.*((numA+numC)./totN); %number of new infectious individuals per day

figure(1); %open first figure window
  hold on; %tells Matlab to plot multiple lines on a single figure
 plot(T,propS); %plotting proportion of susceptibles over time
 plot(T,propA);  %plotting proportion of acute infectious over time
 plot(T,propC); %plotting proportion of chronic infectious over time
 hold off %stop plotting lines on your figure
 legend('Susceptible', 'Acute Infectious', 'Chronic Infectious') %defining legend
 xlabel('Year') %defining x-axis label
 ylabel('Proportion of population') %defining y-axis label
 
figure(2); %open second figure window
 plot(T,incidence); %plotting incidence per day over time
  xlabel('Year') %defining x-axis label
  ylabel('Number of new infectious individuals/year') %defining y-axis label
  %axis([0 131 0 10]) %this will set our x-axis bounds from 0 to 131 years and from 0 to 100 new infections per day



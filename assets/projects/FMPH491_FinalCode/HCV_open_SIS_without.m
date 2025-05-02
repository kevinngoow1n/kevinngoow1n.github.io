function HCV_open_SIS_without

init_s = 774432; %initial number susceptible
init_a = 1; %initial number acute infecteds
init_c = 1; %initial number chronic infecteds
initconditions = [init_s, init_a, init_c]; %creating a vector of initial conditions.\

tspan = linspace(1850, 2030, 181); %vector of time span for simulations. 100 days split into 101 time stamps.

[T,Y] = ode45(@HCV_without, tspan, initconditions); %Y is ODE output as a matrix with solutions at each time stamp, T is output timepoint vector of 121 time stamps. @sir is function of the ODES.

numS = Y(:,1);
numA = Y(:,2);
numC = Y(:,3);
totN = numS + numA + numC;

%Proportion of population in each compartment
propS = numS./totN; %calculating proportion susceptible over time (element by element division)
propA = numA./totN; %calculating proportion acute infectious over time
propC = numC./totN; %calculating proportion chronic infectious over time

%Incidence
beta = 0.275; %same parameter as in the ODE code
incidence = beta.*numS.*((numA + numC)./totN); %number of new chronic infectious individuals per day

decinc = (incidence(167) - incidence(171))/incidence(167)

figure(1);
clf
plot(T,incidence);
xlabel('Year')
ylabel('Number of new infectious individuals/Year')
title('Incidence of PWID without intervention')

figure(2);
clf
hold on;
plot(T,propS);
plot(T,propA);
plot(T,propC);
hold off
legend('Susceptible','Acute Infected','Chronic Infected');
xlabel('Year')
ylabel('Proportion of Population')
title('HCV chronic prevalence of PWID without intervention')

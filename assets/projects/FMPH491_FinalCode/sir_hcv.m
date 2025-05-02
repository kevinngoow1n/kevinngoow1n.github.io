function dy = sir_hcv(t,y)
dy = zeros(3,1);
beta = 0.25;   %effective contact rate
gamma = 1/11; %drug quitting rate
delta = 1/60; %general death rate
alpha = 2; %transition rate from acute infectious to chronic infectious
sigma = 0.75; %percentage people transitioning from acute infectious to chronic infectious
mu_A = alpha*(1-sigma); %recovery rate of acute infectious people
if t<2016
   treatrate=0;
else
   treatrate=0.23;
end
mu_C = treatrate*0.95

N = 774434;
D = delta*N+gamma*N;

dy(1) = D + mu_A*y(2) + mu_C*y(3) - (beta*(y(2)+y(3))*y(1))/N - gamma*y(1) - delta*y(1);  %rate of change in susceptibles
dy(2) = (beta*(y(2)+y(3))*y(1))/N - alpha*sigma*y(2) - gamma*y(2) - delta*y(2) - mu_A*y(2); %rate of change in acuet infectious
dy(3) = alpha*sigma*y(2) - gamma*y(3) - delta*y(3) - mu_C*y(3); %rate of change in chronic infectious

end

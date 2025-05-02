function dy = HCV(t,y)

dy = zeros(3,1);
% finding beta
beta = 0.275;
alpha = 2;
sigma = 3/4;
mu_a = alpha*(1-sigma);
if t < 2016;
    treatment_rate = 0;
    mu_c = treatment_rate*0.95;
end
if t >= 2016;
    treatment_rate = 0.255;
    mu_c = treatment_rate*0.95;
end
gamma = 1/11;
delta = 1/60;
N = 774434;
D = delta*N + gamma*N;
 
dy(1) = D + mu_a*y(2) + mu_c*y(3) -  (beta*(y(2)+y(3))*y(1))/N - gamma*y(1) - delta*y(1); 
dy(2) = (beta*(y(2)+y(3))*y(1))/N - alpha*sigma*y(2) - gamma*y(2) - delta*y(2) - mu_a*y(2);
dy(3) = alpha*sigma*y(2) - gamma*y(3) - delta*y(3) - mu_c*y(3);

end
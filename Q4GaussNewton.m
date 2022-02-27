A = 10*rand();  %random amplitude
f_r = 5 + rand() * 5;   %random frequency
p_r = 360 * rand();  %random phase
y = [];     %data points list
t_list = [];    %time list
for k=1:100     %generating data point measurements values
    t_i = k / 5*f_r;
    t_list(k) = t_i;
    noise = sqrt(A*A/10) * randn();
    y(k) = A*sin(2*pi*f_r*t_i + p_r) + noise;
end



format long
a = [A;f_r;p_r]; %initial approximations for unknowns
maxstep = 30; %set maximum number of steps to run for
q = y; %measurement values
p = t_list;%times
m=length(p); %determine number of functions
n=length(a); %determine number of unkowns
aold = a; %set aold equal to initial guess
for k=1:maxstep %iterate through process
    S = 0;
    for i=1:m
        for j=1:n
            J(i,j) = df(p(i),a(1,1),a(2,1),a(3,1),j); %calculate Jacobian
            
        end
    end
    JT = transpose(J);
    Jz = (inv(JT*J));
    g = (Jz)*JT; %multiply Jz by J transpose
    for i=1:m
        r(i,1) = q(i) - a(1,1)*sin(2.*pi.*a(2,1)*p(i) + a(3,1));    %calculate r
    end
    a = aold-(g*r); %calculate new approximation
    unknowns = a;
    aold = a; %set aold to a
end
p = t_list
f = a(1,1)*sin(2*pi*a(2,1)*p + a(3,1))


hold on
stem(p,q,'b*') %plot the data points
plot(p,f) %plot the approximation of the function
title('Gauss-Newton Approximation of Discrete Data Points') 
xlabel('Time')
legend('Curve Fitting')
hold off

function value = df(p,a1,a2,a3,index) %calculate partials
switch index
 case 1
 value = -(sin(2.*pi.*a2*p + a3));
 case 2
 value = -(2*pi*p*a1*cos(2.*pi.*a2*p + a3));
 case 3
 value = -(a1*cos(2.*pi.*a2*p + a3));
end
end

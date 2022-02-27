# Newton’s Method for Nonlinear Least Squares

## Newton Method
Now we'll look at a specific type of optimization problem and how Newton's approach can be used to solve it.
Firstly we generate 100 noisy data of a sinusoid as <br/>
![screenshot 38](https://user-images.githubusercontent.com/78887209/153723064-595284dc-12bf-42aa-a040-d587cdd6ccf9.jpg) <br/>
where A is the amplitude between 1-10, f is the frequency between 5-10 Hz and Φ is the phase between 0-2π rd.<br/> 
![screenshot 39](https://user-images.githubusercontent.com/78887209/153723187-3954e4e8-f5e8-466f-8472-ad8451baac59.jpg) <br/> 
wi is a zero-mean Gaussian noise whose variance is given as 
![screenshot 40](https://user-images.githubusercontent.com/78887209/153723223-2ebc7cef-77a4-40c5-8821-d0bee9ffc406.jpg) <br/> 
<br/> 
 ![NOİSY DATA POİNTS](https://user-images.githubusercontent.com/78887209/154059447-2249f5f8-3fa2-42b4-9952-61eecdbb4dab.png)
<br/> 
 After creating 100 noisy data points, we can move on to a sinusoid fitting process with Newton's method.
 We wish to fit a sinusoid to the measurement data. The equation of the sinusoid is: y = A.sin(2πft+ɸ) with appropriate choices of the parameters A,f and ɸ.
 To formulate the data-fitting problem, we construct the objective function ∑ (yi - A.sin(2πfti+ɸ)*yi - A.sin(2πfti+ɸ)) where i = 1,2,3,....,100 and yi's are the measurement nosiy data points. <br/> 
 Let x = [A,f,ɸ]T represent the vector of decision variables.To apply Newton’s method, we need to compute the gradient and the Hessian of f.For calculating Jacobian and Hessian of objective function we defining a function of which calculate partial derivative of f. <br/> 
 f(x) = transpose(r(x)) * r(x) <br/>
 To apply Newton’s method, we need to compute the gradient of f.So we get the Jacobien with the function we defined.Then, the gradient of f can be represented as d[f(x)]=2*transpose(J(x))*r(x)  <br/>
 Newton’s method applied to the nonlinear least-squares problem is given by x(k+1) = x(k) * inverse[transpose(J(x))*J(x)] * transpose[J(x)] * r(x) <br/>
 When we fit the curve with the non-linear Gaussian method, we get the graph below.
 ![screenshot 41](https://user-images.githubusercontent.com/78887209/155899779-b9753246-b3ed-435f-b25a-b471590c1fab.jpg)


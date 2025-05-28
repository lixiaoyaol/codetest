# f'(x)=sqrt(y) f(0)=1 f(x)=1+x+1./4x^2

import numpy as np
import matplotlib.pyplot as plt

# Theoretical solution of ODE
def f(x:np.ndarray) -> np.ndarray:
    return np.array([1+xi+0.25*xi**2 for xi in x])

x0 = np.linspace(0, 20, 100)
y0 = f(x0)


# Number of points and step size
nn = 50
h = 20. / nn

# # forward Euler method for solving ODEs
x1 = np.linspace(0, 20, nn)
y1 = np.zeros(nn)
y1[0] = 1
for i in range(1, nn):
    y1[i] = y1[i-1] + h * np.sqrt(y1[i-1])


# Newton-Raphson iteration
def newton_raphson(f, df, yn, h):
    yn1 = yn
    while abs(f(yn1, yn, h)) > 1e-6:
        yn1 = yn1 - f(yn1, yn, h) / df(yn1, yn, h)
    return yn1


# # backward Euler method for solving ODEs
def f2(yn1, yn, h):
    return h*np.sqrt(yn1) - yn1 + yn

def df2(yn1, yn, h):
    return h*0.5*np.power(yn1,-0.5) - 1

x2 = np.linspace(0, 20, nn)
y2 = np.zeros(nn)
y2[0] = 1

# newton-raphson iteration to solve y_{n+1}
for i in range(1, nn):
    y2[i] = newton_raphson(f2, df2, y2[i-1], h)



# Medium Euler method for solving ODEs
def f3(yn1, yn, h):
    return h*np.sqrt(0.5 * (yn1+yn)) - yn1 + yn

def df3(yn1, yn, h):
    return h / (2*np.sqrt(2)) / np.sqrt(yn1+yn) - 1

x3 = np.linspace(0, 20, nn)
y3 = np.zeros(nn)
y3[0] = 1

# newton-raphson iteration to solve y_{n+1}
for i in range(1, nn):
    y3[i] = newton_raphson(f3, df3, y3[i-1], h)


## plot figure
fig, ax = plt.subplots()
ax.plot(x0, y0, label=r'$y=1+x+\frac{1}{4}x^2$')
ax.plot(x1, y1, label='Forward Euler')
ax.plot(x2, y2, label='Backward Euler')
ax.plot(x3, y3, label='Medium Euler')
ax.set_title('Forward, Backward, Mediunm Euler methods')
ax.set_xlabel('x')
ax.set_ylabel('y')
ax.grid(True)
ax.legend()

plt.show()
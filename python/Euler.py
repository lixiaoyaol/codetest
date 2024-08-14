# y'=y, y(0)=1


import numpy as np
import matplotlib.pyplot as plt

x0 = np.linspace(0, 4, 100)
y0 = np.exp(x0)

nn = 20
h = 4. / nn

# forward Euler method for solving ODEs
x1 = np.linspace(0, 4, nn)
y1 = np.zeros(nn)
y1[0] = 1
for i in range(1, nn):
    y1[i] = y1[i-1] + h * y1[i-1]



# backward Euler method for solving ODEs
x2 = np.linspace(0, 4, nn)
y2 = np.zeros(nn)
y2[0] = 1
for i in range(1, nn):
    y2[i] = y2[i-1] / (1 - h)


# medium Euler method for solving ODEs
x3 = np.linspace(0, 4, nn)
y3 = np.zeros(nn)
y3[0] = 1
for i in range(1, nn):
    y3[i] = y3[i-1] * (1+h/2.) / (1-h/2.)


fig, ax = plt.subplots()
ax.plot(x0, y0, label=r'$y=e^x$')
ax.plot(x1, y1, label='Forward Euler')
ax.plot(x2, y2, label='Backward Euler')
ax.plot(x3, y3, label='Medium Euler')
ax.set_title('Forward, Backward, Mediunm Euler methods')
ax.set_xlabel('x')
ax.set_ylabel('y')
ax.grid(True)
ax.legend()

plt.show()
import numpy as np

def f(x):
    return x**3 + 6 * x**2 + 5

def df(x):
    return 3 * x**2 + 12 * x

x = 6.
toler = 1.e-6

while abs(f(x)) > toler:
    x = x - f(x) / df(x)
    print(x)

print('f(x)=', f(x))

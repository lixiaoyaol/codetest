# def f(x, m):
#     return x - m**2 + m

# def gm(x):
#     return 2 * x

# def fx(m):
#     return m**2 + m

# m = -2
# x = fx(m)

# for i in range(10):
#     m = gm(x)
#     x = fx(m)
#     res = f(x, m)
#     print(f"m: {m}, x: {x}, res: {res}")


# 将m带入，简化为一个变量
# def f(x):
#     return 4*x**2 + 3*x

# def df(x):
#     return 8*x + 3

# x = 12

# for i in range(20):
#     x = x - f(x) / df(x)
#     print(x)

import numpy as np

def gx(x, m):
    return np.array([x - m**2 + m, m - 2*x])

def J(m):
    return np.array([[1, -2*m + 1], [-2, 1]])

x = np.array([4, 8])
for i in range(10):
    x = x - np.linalg.inv(J(x[1])) @ (gx(x[0], x[1]))
    print(x)
# f(x)=x^3-10x^2+x+1

def f(x):
    return x**3 - 10*x**2 + x + 1


def df(x):
    return 3*x**2 - 20*x + 1


# x = 1
# for i in range(100):
#     x = x - f(x)/df(x)
#     print(x)
#     if abs(f(x)) < 1e-6:
#         break


x = 1
while abs(f(x)) > 1e-6:
    x = x - f(x)/df(x)
    print('x :', x, 'f(x) :', f(x))


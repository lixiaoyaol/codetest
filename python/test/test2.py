def g(data):
    return data * data

def f(x):
    breakpoint()
    ls = []
    for i in range(x):
        val = g(i)
        ls.append(val)
    return ls

f(3)
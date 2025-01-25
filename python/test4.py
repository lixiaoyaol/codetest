class A:
    def __init__(self):
        print('init')

    def __repr__(self):
        return 'repr'
    # def __str__(self):
    #     return 'str'
    
a = A()
print(a)
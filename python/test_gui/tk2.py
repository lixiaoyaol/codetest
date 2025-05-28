# import tkinter as tk

# class APP:
#     def __init__(self, root):
#         frame = tk.Frame(root)
#         frame.pack()

#         self.hi_there = tk.Button(frame, text='Hello', fg='blue', command=self.say_hi)
#         self.hi_there.pack(side=tk.LEFT)

#     def say_hi(self):
#         print('Hello, everyone!')


# root = tk.Tk()
# app = APP(root)
# root.mainloop()

# import tkinter as tk

# root = tk.Tk()

# # 外层 Frame
# frame1 = tk.Frame(root, bg="lightblue", width=300, height=200)
# frame1.pack(padx=10, pady=10)

# # 内层 Frame
# frame2 = tk.Frame(frame1, bg="pink", width=200, height=100)
# frame2.pack(padx=10, pady=10)

# label1 = tk.Label(frame2, text="Label 1")
# label1.pack(pady=10)

# label2 = tk.Label(frame2, text="Label 2")
# label2.pack(pady=10)

# root.mainloop()

# import tkinter as tk

# root = tk.Tk()
# root.geometry('800x600')

# frame1 = tk.Frame(root, width=300, height=200, bg="lightblue")
# # frame1.pack(padx=10, pady=10)  # 将 Frame 添加到窗口中
# frame1.grid(row=0, column=0, padx=20, pady=20)

# label1 = tk.Label(frame1, text="Label 1", bg="yellow")
# label1.grid(row=0, column=0, padx=10, pady=10)

# label2 = tk.Label(frame1, text="Label 2", bg="green")
# label2.grid(row=1, column=0, padx=10, pady=10)

# frame2 = tk.Frame(root, bg="pink", width=300, height=200, relief="ridge", bd=2)
# frame2.grid(row=0, column=0, padx=20, pady=20)

# label3 = tk.Label(frame2, text="Label 1", bg="yellow")
# label3.grid(row=0, column=2, padx=10, pady=10)

# label4 = tk.Label(frame2, text="Label 2", bg="green")
# label4.grid(row=1, column=2, padx=10, pady=10)


# root.mainloop()

# import tkinter as tk

# root = tk.Tk()
# root.geometry('800x600')

# var = tk.IntVar()

# c = tk.Checkbutton(root, text='Check me', variable=var)
# c.pack()

# l1 = tk.Label(root, textvariable=var)
# l1.pack()

# root.mainloop()

# import tkinter as tk

# root = tk.Tk()

# girls = ['西施', '王昭君', '貂蝉', '杨玉环']
# v = []

# for g in girls:
#     v.append(tk.IntVar())
#     b = tk.Checkbutton(root, text=g, variable=v[-1])
#     b.pack(anchor='w')

# root.mainloop()

# import tkinter as tk

# root = tk.Tk()
# var = tk.IntVar()

# for i in range(3):
#     tk.Radiobutton(root, text=f'Option {i}', variable=var, value=i).pack()

# # tk.Radiobutton(root, text='Option A', variable=var, value=1).pack()
# # tk.Radiobutton(root, text='Option B', variable=var, value=2).pack()
# # tk.Radiobutton(root, text='Option C', variable=var, value=3).pack()

# root.mainloop()


# import tkinter as tk

# root = tk.Tk()

# ee = tk.Entry(root)
# ee.pack(padx=20, pady=20)

# ee.delete(0, tk.END)
# ee.insert(0, 'Hello, world!')

# tk.mainloop()

# import tkinter as tk

# root = tk.Tk()

# tk.Label(root, text='User Name').grid(row=0, column=0)
# tk.Label(root, text='Password').grid(row=1, column=0)

# v1 = tk.StringVar()
# v2 = tk.StringVar()


# e1 = tk.Entry(root, textvariable=v1)
# e2 = tk.Entry(root, textvariable=v2, show='*')
# e1.grid(row=0, column=1, padx=10, pady=10)
# e2.grid(row=1, column=1, padx=10, pady=10)

# def show():
#     print('Username:', e1.get())
#     print('Password:', e2.get())

# bt1 = tk.Button(root, text='Show', width=10, command=show)
# bt2 = tk.Button(root, text='Quit', width=10, command=root.quit)
# bt1.grid(row=2, column=0, sticky=tk.W, padx=10, pady=10)
# bt2.grid(row=2, column=1, sticky=tk.E, padx=10, pady=10)

# tk.mainloop()

# import tkinter as tk

# root = tk.Tk()

# tk.Label(root, text='Hello World', font=('Arial', 20)).pack()


# tk.mainloop()

# import tkinter as tk

# root = tk.Tk()

# li = ['C', 'Python', 'C++', 'Java', 'PHP', 'HTML', 'SQL', 'JavaScript']
# movie = ['CSS', 'jQuery', 'Bootstrap']

# listb = tk.Listbox(root)
# listb2 = tk.Listbox(root)

# for item in li:
#     listb.insert(tk.END, item)

# for item in movie:
#     listb2.insert(tk.END, item)

# listb.pack()
# listb2.pack()

# tk.mainloop()

# import tkinter as tk

# root = tk.Tk()

# root.title('Heart')
# root.geometry('800x600')
# btn = tk.Button(root, text='Hit me', cursor='heart')
# btn.pack()

# tk.mainloop()

# import tkinter as tk

# root = tk.Tk()
# root.title('Test')
# root.geometry('800x600')
# lab = tk.Label(root, text='Account:  ')
# ent = tk.Entry(root)
# btn = tk.Button(root, text='login')
# # lab.pack(side='left')
# # ent.pack(side='left')
# # btn.pack(side='left')

# lab.grid(row=0, column=0)
# ent.grid(row=0, column=1)
# btn.grid(row=0, column=2, padx=10)

# root.mainloop()

# import tkinter as tk

# def show(aa):
#     print('Account:  ', ent1.get())
#     print('Password:  ', ent2.get())
#     print(aa)

# root = tk.Tk()
# root.title('Test')
# root.geometry('800x600')

# lab1 = tk.Label(root, text='Account:  ')
# lab2 = tk.Label(root, text='Password:  ')

# ent1 = tk.Entry(root)
# ent2 = tk.Entry(root, show='*')

# btn = tk.Button(root, text='login', command=show('aa'))

# lab1.grid(row=0, column=0)
# lab2.grid(row=1, column=0)
# ent1.grid(row=0, column=1)
# ent2.grid(row=1, column=1)
# btn.grid(row=2, column=1)

# root.mainloop()

# import tkinter as tk

# def show(var):
#     var.set('Input here')

# root = tk.Tk()
# root.title('Test')
# root.geometry('800x600')

# var = tk.StringVar()
# ent = tk.Entry(root, textvariable=var)
# btn = tk.Button(root, text='Set', command=lambda: show(var))

# ent.pack()
# btn.pack()

# var2 = tk.IntVar()
# r1 = tk.Radiobutton(root, text='man', variable=var2, value=1)
# r2 = tk.Radiobutton(root, text='woman', variable=var2, value=2)
# r1.pack(anchor='w')
# r2.pack(anchor='w')

# c1 = tk.Checkbutton(root, text='Python')
# c2 = tk.Checkbutton(root, text='Java')
# c1.pack(anchor='w')
# c2.pack(anchor='w')

# root.mainloop()

# import tkinter as tk

# def gen_trigger(frm, lab_text):
#     lab = tk.Label(frm, text=lab_text)
#     var = tk.IntVar()
#     btn = tk.Radiobutton(frm, text='Yes', variable=var, value=0)
#     btn2 = tk.Radiobutton(frm, text='No', variable=var, value=1)
#     lab.grid(row=0, column=0, padx=10)
#     btn.grid(row=0, column=1)
#     btn2.grid(row=0, column=2)
#     return var

# root = tk.Tk()
# frm1 = tk.Frame(root)
# var1 = gen_trigger(frm1, 'Enable Isotropic Hardening')
# frm1.pack()

# root.mainloop()

# import tkinter as tk

# root = tk.Tk()

# def callback(event):
#     print('clicked at', event.x, event.y)


# def callback2(event):
#     print('input:', repr(event.char))

# frm = tk.Frame(root, width=200, height=200)
# frm.bind('<Button-1>', callback)
# frm.pack()

# frm2 = tk.Frame(root, width=200, height=200)
# frm2.bind('<Key>', callback2)
# frm2.focus_set()
# frm2.pack()


# root.mainloop()


import tkinter as tk

root = tk.Tk()

frm = tk.Frame(root)
frm.pack(padx=10, pady=10)

v1 = tk.StringVar()
v2 = tk.StringVar()
v3 = tk.StringVar()

def test(content):
    if content.isdigit():
        return True
    else:
        return False
    

testCMD = root.register(test)

e1 = tk.Entry(frm, textvariable=v1, validate='key', validatecommand=(testCMD, '%P'))
e1.grid(row=0, column=0)

lab1 = tk.Label(frm, text='+')
lab1.grid(row=0, column=1)

e2 = tk.Entry(frm, textvariable=v2, validate='key', validatecommand=(testCMD, '%P'))
e2.grid(row=0, column=2)

lab2 = tk.Label(frm, text='=')
lab2.grid(row=0, column=3)

e3 = tk.Entry(frm, textvariable=v3, validate='key', validatecommand=(testCMD, '%P'), state='readonly')
e3.grid(row=0, column=4)

def calc():
    result = int(v1.get()) + int(v2.get())
    v3.set(str(result))

btn = tk.Button(frm, text='Calculate', command=calc)
btn.grid(row=1, column=2, pady=10)

tk.mainloop()

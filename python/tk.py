import tkinter as tk

root = tk.Tk()

screen_w, screen_h = root.maxsize()
root.geometry(f'{int(0.6*screen_w)}x{int(0.6*screen_h)}')

root.title('UMAT Controller')

frm1 = tk.Frame(root)
frm2 = tk.Frame(root, relief='groove', borderwidth=2)
frm3 = tk.Frame(root)

label1 = tk.Label(root, text='UCP Subroutine Controller', font=('Arial', 14))
label1.pack()

label2 = tk.Label(frm1, text='Controller Version 1.0', anchor='w')
label2.pack(fill='x')
label3 = tk.Label(frm1, text='Subroutine Version 1.0', anchor='w')
label3.pack(fill='x')
label4 = tk.Label(frm1, text='Author: Li Bofeng Mail: bf_li@qq.com', anchor='w')
label4.pack(fill='x')
label4 = tk.Label(frm1, text='@Copyright - 2024', anchor='w')
label4.pack(fill='x')
frm1.pack(side='top', anchor='w')


label5 = tk.Label(frm2, text='Select Solver Type: ')
solver_var = tk.IntVar()
solver_type1 = tk.Radiobutton(frm2, text='3D', variable=solver_var, value=0)
solver_type2 = tk.Radiobutton(frm2, text='2D-Stress', variable=solver_var, value=1)
solver_type3 = tk.Radiobutton(frm2, text='2D-Strain', variable=solver_var, value=2)
label5.pack(side='left', anchor='n')
solver_type1.pack(side='left', anchor='n')
solver_type2.pack(side='left', anchor='n')
solver_type3.pack(side='left', anchor='n')
frm2.pack(side='top', anchor='w')

btn_ucp = tk.Button(frm3, text='UCP Parameters')
btn_iso = tk.Button(frm3, text='Isotropic Hardening Parameters')
btn_kin = tk.Button(frm3, text='Kinematic Hardening Parameters')
btn_dmg = tk.Button(frm3, text='Damage Parameters')
btn_ucp.pack(side='left')
btn_iso.pack(side='left')
btn_kin.pack(side='left')
btn_dmg.pack(side='left')
frm3.pack(side='top', anchor='w')



root.mainloop()
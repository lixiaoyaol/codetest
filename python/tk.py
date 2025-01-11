import tkinter as tk

root = tk.Tk()

# screen_w, screen_h = root.maxsize()
# root.geometry(f'{int(0.6*screen_w)}x{int(0.6*screen_h)}')
root.geometry('800x600')

def show_frm(sub_type):
    match sub_type:
        case 'UCP':
            frm4.pack(side='top', anchor='w', pady=10)
            frm5.pack_forget()
            frm6.pack_forget()
            frm7.pack_forget()
        case 'ISO':
            frm5.pack(side='top', anchor='w', pady=10)
            frm4.pack_forget()
            frm6.pack_forget()
            frm7.pack_forget()
        case 'KIN':
            frm6.pack(side='top', anchor='w', pady=10)
            frm4.pack_forget()
            frm5.pack_forget()
            frm7.pack_forget()
        case 'DMG':
            frm7.pack(side='top', anchor='w', pady=10)
            frm4.pack_forget()
            frm5.pack_forget()
            frm6.pack_forget()

root.title('UMAT Controller')

frm1 = tk.Frame(root)  # Title information
frm2 = tk.Frame(root, relief='groove', borderwidth=2)  # Solver type
frm3 = tk.Frame(root)  # Model parameters buttons
frm4 = tk.Frame(root)  # UCP parameters label and entry
frm5 = tk.Frame(root)  # Isotropic hardening parameters label and entry
frm6 = tk.Frame(root)  # Kinematic hardening parameters label and entry
frm7 = tk.Frame(root)  # Damage parameters label and entry
frm8 = tk.Frame(root)  # Load and save buttons

# Title information
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

# Solver type
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

# Model parameters buttons
btn_ucp = tk.Button(frm3, text='UCP Parameters', command=lambda: show_frm('UCP'))
btn_iso = tk.Button(frm3, text='Isotropic Hardening Parameters', command=lambda: show_frm('ISO'))
btn_kin = tk.Button(frm3, text='Kinematic Hardening Parameters', command=lambda: show_frm('KIN'))
btn_dmg = tk.Button(frm3, text='Damage Parameters', command=lambda: show_frm('DMG'))
btn_ucp.pack(side='left')
btn_iso.pack(side='left')
btn_kin.pack(side='left')
btn_dmg.pack(side='left')
frm3.pack(side='top', anchor='w')

def gen_lab_ent(frm, fields, start_row=0):
    for i, (lab_text, dft_val) in enumerate(fields.items()):
        lab = tk.Label(frm, text=lab_text)
        ent = tk.Entry(frm)
        if dft_val:
            ent.insert(0, dft_val)
        lab.grid(row=(i+start_row), column=0, padx=10)
        ent.grid(row=(i+start_row), column=1)


def gen_trigger(frm, lab_text):
    lab = tk.Label(frm, text=lab_text)
    var = tk.IntVar()
    btn = tk.Radiobutton(frm, text='Yes', variable=var, value=0)
    btn2 = tk.Radiobutton(frm, text='No', variable=var, value=1)
    lab.grid(row=0, column=0, padx=10)
    btn.grid(row=0, column=1)
    btn2.grid(row=0, column=2)
    return var

# UCP Parameters
fields_ucp = {
    'A': None,
    'B': None,
    'n': None,
    'd': None,
    'Q': None,
    'R': 8.314,
    'T': 298
}
gen_lab_ent(frm4, fields_ucp)
frm4.pack(side='top', anchor='w', pady=10)


# Isotropic hardening parameters
fields_iso = {
    'R0': None,
    'Rinf': None,
    'Rb': None
}
var_iso_trig = gen_trigger(frm5, 'Enable Isotropic Hardening')
gen_lab_ent(frm5, fields_iso, 1)
# frm5.pack(side='top', anchor='w')

# Kinematic hardening parameters
fields_kin = {
    'mu': None,
    'beta': None
}
var_kin_trig = gen_trigger(frm6, 'Enable Kinematic Hardening')
gen_lab_ent(frm6, fields_kin, 1)
# frm6.pack(side='top', anchor='w')

# Damage parameters
fields_dmg = {
    'lambda': None,
    'rho': None,
    'ms': None,
    'R': 8.314,
    'T': 298
}
var_dmg_trig = gen_trigger(frm7, 'Enable Damage')
gen_lab_ent(frm7, fields_dmg, 1)
# frm7.pack(side='top', anchor='w')

# Load and save buttons
btn_load = tk.Button(frm8, text='Load Configurations')
btn_save = tk.Button(frm8, text='Save Changes')
btn_load.pack(side='top', pady=10)
btn_save.pack(side='top')
frm8.pack(side='bottom', anchor='s', pady=20)



root.mainloop()
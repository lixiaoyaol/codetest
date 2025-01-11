import tkinter as tk

root = tk.Tk()

# screen_w, screen_h = root.maxsize()
# root.geometry(f'{int(0.6*screen_w)}x{int(0.6*screen_h)}')
root.geometry('800x600')

def show_sub_params(sub_type):
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
btn_ucp = tk.Button(frm3, text='UCP Parameters', command=lambda: show_sub_params('UCP'))
btn_iso = tk.Button(frm3, text='Isotropic Hardening Parameters', command=lambda: show_sub_params('ISO'))
btn_kin = tk.Button(frm3, text='Kinematic Hardening Parameters', command=lambda: show_sub_params('KIN'))
btn_dmg = tk.Button(frm3, text='Damage Parameters', command=lambda: show_sub_params('DMG'))
btn_ucp.pack(side='left')
btn_iso.pack(side='left')
btn_kin.pack(side='left')
btn_dmg.pack(side='left')
frm3.pack(side='top', anchor='w')

# UCP Parameters
lab_ucp_aa = tk.Label(frm4, text='A')
ent_ucp_aa = tk.Entry(frm4)
lab_ucp_aa.grid(row=0, column=0, padx=10)
ent_ucp_aa.grid(row=0, column=1)
lab_ucp_bb = tk.Label(frm4, text='B')
ent_ucp_bb = tk.Entry(frm4)
lab_ucp_bb.grid(row=1, column=0, padx=10)
ent_ucp_bb.grid(row=1, column=1)
lab_ucp_nn = tk.Label(frm4, text='n')
ent_ucp_nn = tk.Entry(frm4)
lab_ucp_nn.grid(row=2, column=0, padx=10)
ent_ucp_nn.grid(row=2, column=1)
lab_ucp_dd = tk.Label(frm4, text='d')
ent_ucp_dd = tk.Entry(frm4)
lab_ucp_dd.grid(row=3, column=0, padx=10)
ent_ucp_dd.grid(row=3, column=1)
lab_ucp_qq = tk.Label(frm4, text='Q')
ent_ucp_qq = tk.Entry(frm4)
lab_ucp_qq.grid(row=4, column=0, padx=10)
ent_ucp_qq.grid(row=4, column=1)
lab_ucp_rr = tk.Label(frm4, text='R')
ent_ucp_rr = tk.Entry(frm4)
ent_ucp_rr.insert(0, '8.314')
lab_ucp_rr.grid(row=5, column=0, padx=10)
ent_ucp_rr.grid(row=5, column=1)
lab_ucp_tt = tk.Label(frm4, text='T')
ent_ucp_tt = tk.Entry(frm4)
ent_ucp_tt.insert(0, '298')
lab_ucp_tt.grid(row=6, column=0, padx=10)
ent_ucp_tt.grid(row=6, column=1)
frm4.pack(side='top', anchor='w', pady=10)


# Isotropic hardening parameters
lab_iso_trig = tk.Label(frm5, text='Enable Isotropic Hardening')
var_iso_trig = tk.IntVar()
btn_iso_trig = tk.Radiobutton(frm5, text='Yes', variable=var_iso_trig, value=0)
btn_iso_trig2 = tk.Radiobutton(frm5, text='No', variable=var_iso_trig, value=1)
lab_iso_trig.grid(row=0, column=0, padx=10)
btn_iso_trig.grid(row=0, column=1)
btn_iso_trig2.grid(row=0, column=2)
lab_iso_r0 = tk.Label(frm5, text='R0')
ent_iso_r0 = tk.Entry(frm5)
lab_iso_r0.grid(row=1, column=0, padx=10)
ent_iso_r0.grid(row=1, column=1)
lab_iso_inf = tk.Label(frm5, text='Rinf')
ent_iso_inf = tk.Entry(frm5)
lab_iso_inf.grid(row=2, column=0, padx=10)
ent_iso_inf.grid(row=2, column=1)
lab_iso_rb = tk.Label(frm5, text='Rb')
ent_iso_rb = tk.Entry(frm5)
lab_iso_rb.grid(row=3, column=0, padx=10)
ent_iso_rb.grid(row=3, column=1)
# frm5.pack(side='top', anchor='w')

# Kinematic hardening parameters
lab_iso_trig = tk.Label(frm6, text='Enable kintropic Hardening')
var_kin_trig = tk.IntVar()
btn_kin_trig = tk.Radiobutton(frm6, text='Yes', variable=var_kin_trig, value=0)
btn_kin_trig2 = tk.Radiobutton(frm6, text='No', variable=var_kin_trig, value=1)
lab_iso_trig.grid(row=0, column=0, padx=10)
btn_kin_trig.grid(row=0, column=1)
btn_kin_trig2.grid(row=0, column=2)
lab_kin_mu = tk.Label(frm6, text='mu')
ent_kin_mu = tk.Entry(frm6)
lab_kin_mu.grid(row=1, column=0, padx=10)
ent_kin_mu.grid(row=1, column=1)
lab_kin_beta = tk.Label(frm6, text='beta')
ent_kin_beta = tk.Entry(frm6)
lab_kin_beta.grid(row=2, column=0, padx=10)
ent_kin_beta.grid(row=2, column=1)
# frm6.pack(side='top', anchor='w')

# Damage parameters
lab_dmg_trig = tk.Label(frm7, text='Enable Damage')
var_dmg_trig = tk.IntVar()
btn_dmg_trig = tk.Radiobutton(frm7, text='Yes', variable=var_dmg_trig, value=0)
btn_dmg_trig2 = tk.Radiobutton(frm7, text='No', variable=var_dmg_trig, value=1)
lab_dmg_trig.grid(row=0, column=0, padx=10)
btn_dmg_trig.grid(row=0, column=1)
btn_dmg_trig2.grid(row=0, column=2)
lab_dmg_lambda = tk.Label(frm7, text='lambda')
ent_dmg_lambda = tk.Entry(frm7)
lab_dmg_lambda.grid(row=1, column=0, padx=10)
ent_dmg_lambda.grid(row=1, column=1)
lab_dmg_rho = tk.Label(frm7, text='rho')
ent_dmg_rho = tk.Entry(frm7)
lab_dmg_rho.grid(row=2, column=0, padx=10)
ent_dmg_rho.grid(row=2, column=1)
lab_dmg_ms = tk.Label(frm7, text='ms')
ent_dmg_ms = tk.Entry(frm7)
lab_dmg_ms.grid(row=3, column=0, padx=10)
ent_dmg_ms.grid(row=3, column=1)
lab_dmg_rr = tk.Label(frm7, text='R')
ent_dmg_rr = tk.Entry(frm7)
lab_dmg_rr.grid(row=4, column=0, padx=10)
ent_dmg_rr.grid(row=4, column=1)
lab_dmg_tt = tk.Label(frm7, text='T')
ent_dmg_tt = tk.Entry(frm7)
lab_dmg_tt.grid(row=5, column=0, padx=10)
ent_dmg_tt.grid(row=5, column=1)
# frm7.pack(side='top', anchor='w')

# Load and save buttons
btn_load = tk.Button(frm8, text='Load Configurations')
btn_save = tk.Button(frm8, text='Save Changes')
btn_load.pack(side='top', pady=10)
btn_save.pack(side='top')
frm8.pack(side='bottom', anchor='s', pady=20)



root.mainloop()
import numpy as np
import matplotlib.pyplot as plt

# Parameter initialization
tu = 0.05
ta = 0.3
td = 0.05
fs = 12000
iu = 2
id = 2
cu = 2
cd = 1
p = 0.85
dp = 0.1
nn = 1000

# Total waveform duration
t1 = tu + ta + td
nt = int(round(fs * t1)) + 1
nfft = int(2 ** np.ceil(np.log2(nt)))
df = fs / nfft
dt = 1 / fs

f = np.arange(0, nfft // 2) * df
t = np.arange(0, nt) * dt
g = np.random.rand(nfft // 2) * 2 * np.pi

# Time envelope
en = np.ones(nt)
l = int(round(tu * fs)) + 1
if iu == 1:
    en[:l] = np.linspace(0, 1, l)
elif iu == 2:
    a = np.arange(l)
    en[:l] = (a / (l - 1)) ** 2
elif iu == 3:
    a = np.arange(l)
    en[:l] = 1 - np.exp(-cu * a / (l - 1))

m = int(round((tu + ta) * fs)) + 1
if id == 1:
    en[m:] = np.linspace(1, 0, nt - m + 1)
elif id == 2:
    a = np.arange(nt - m)
    en[m:] = 1 - cd * (a / (nt - m - 1)) ** 2
elif id == 3:
    a = np.arange(nt - m + 1)
    en[m:] = np.exp(-cd * a / (nt - m))

# Response spectrum data (example data x, replace with actual data)
x = np.array([
    [10, 20, 30, 40, 50],  # Frequency points (Hz)
    [80, 220, 220, 220, 220]
])

a0 = np.zeros(nfft // 2)
n = x.shape[1]
nb = int(round(x[0, 0] / df))
ne = int(round(x[0, -1] / df))
for k in range(n - 1):
    l = int(round(x[0, k] / df))
    m = int(round(x[0, k + 1] / df))
    a0[l:m + 1] = np.linspace(x[1, k], x[1, k + 1], m - l + 1)

a1 = a0.copy()
s = np.zeros(nfft // 2)
k_idx = np.arange(nb, ne + 1)
s[k_idx] = 2 * dp / np.pi * (a1[k_idx] ** 2) / f[k_idx] / (-2 * np.log(-(np.log(p) * np.pi / t1) / f[k_idx]))
b1 = np.sqrt(4 * df * s) * nfft / 2

# Transfer function matrix
hf = np.zeros((ne + 1, nfft), dtype=complex)
for j in range(ne + 1):
    w = 2 * np.pi * df * j
    wd = w * np.sqrt(1 - dp ** 2)
    e = np.exp(-t * w * dp)
    a = t * wd
    s_term = np.sin(a) * ((1 - 2 * dp ** 2) / (1 - dp ** 2))
    c_term = np.cos(a) * (2 * dp / np.sqrt(1 - dp ** 2))
    h = wd * e * (s_term + c_term) / fs
    hf[j, :] = np.fft.fft(h, nfft)

# Iteration process
mm = nn
for k in range(3000):
    c = b1 * np.exp(1j * g)
    d = np.concatenate([c, np.conj(c[::-1])])
    e = np.fft.ifft(d, nfft)
    y = en * np.real(e[:nt])

    yf = np.fft.fft(y, nfft)
    for j in range(ne + 1):
        conv_result = np.fft.ifft(yf * hf[j, :], nfft)
        a1[j] = np.max(np.real(conv_result[:nt]))

    if k == mm:
        plt.subplot(2, 1, 1)
        plt.plot(t, y, label='Signal')
        plt.plot(t, en, 'r--', label='Envelope')
        plt.plot(t, -en, 'r--')
        plt.xlabel('Time (s)')
        plt.ylabel('Acceleration (g)')
        plt.title('Time History Sample')
        plt.grid()
        plt.legend()

        plt.subplot(2, 1, 2)
        plt.plot(f[nb:ne + 1], a0[nb:ne + 1], 'b', label='Target Spectrum')
        plt.plot(f[nb:ne + 1], a1[nb:ne + 1], 'r', label='Computed Spectrum')
        plt.xlabel('Frequency (Hz)')
        plt.ylabel('Acceleration (g)')
        plt.legend()
        plt.grid()
        plt.tight_layout()
        plt.show()

        ig = int(input('Continue iterations [1-9 to continue, 0 to exit]:'))
        if 1 <= ig <= 9:
            mm += ig
        elif ig == 0:
            break
        else:
            print('Invalid input, exiting...')
            break

    b1[nb:ne + 1] = b1[nb:ne + 1] * a0[nb:ne + 1] / a1[nb:ne + 1]

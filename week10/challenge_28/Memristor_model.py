import numpy as np
import matplotlib.pyplot as plt

# Parameters
R_on = 100         # Low resistance (Ohms)
R_off = 16000      # High resistance (Ohms)
D = 10e-9          # Thickness of the memristor (meters)
mu_v = 1e-14       # Dopant mobility (m^2/s/V)
dt = 1e-3          # Time step (seconds)
steps = 1000       # Number of time steps

# Time and input voltage (5 Hz sine wave)
t = np.linspace(0, 1, steps)
v = 1.5 * np.sin(2 * np.pi * 5 * t)

# Initial state
w = np.zeros(steps)        # Width of doped region
w[0] = D / 2               # Start in the middle
i = np.zeros(steps)        # Current through the memristor

# Memristor simulation
for n in range(1, steps):
    R = R_on * (w[n-1] / D) + R_off * (1 - w[n-1] / D)
    i[n] = v[n] / R
    dw = mu_v * R_on * i[n] * dt
    w[n] = np.clip(w[n-1] + dw, 0, D)

# Plot and save I-V curve
plt.plot(v, i)
plt.title("Memristor I-V Curve")
plt.xlabel("Voltage (V)")
plt.ylabel("Current (A)")
plt.grid(True)
plt.tight_layout()
plt.savefig("memristor_iv_curve.png")  # Save the plot as an image
plt.close()


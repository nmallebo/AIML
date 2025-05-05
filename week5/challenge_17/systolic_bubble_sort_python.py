import time
import random
import numpy as np
import matplotlib.pyplot as plt

# --- Sorting Functions ---
def systolic_bubble_sort_python(arr):
    n = len(arr)
    for t in range(n):
        for i in range(t % 2, n - 1, 2):
            if arr[i] > arr[i + 1]:
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
    return arr

def systolic_bubble_sort_numpy(arr):
    n = len(arr)
    for t in range(n):
        for i in range(t % 2, n - 1, 2):
            if arr[i] > arr[i + 1]:
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
    return arr

# --- Test Settings ---
sizes = [10, 100, 500, 1000, 1500, 10000, 15000]
python_times = []
numpy_times = []

# --- Run Timing Tests ---
for size in sizes:
    py_data = random.sample(range(size * 2), size)
    np_data = np.random.permutation(size * 2)[:size]

    py_start = time.time()
    systolic_bubble_sort_python(py_data.copy())
    py_end = time.time()
    python_times.append(py_end - py_start)

    np_start = time.time()
    systolic_bubble_sort_numpy(np_data.copy())
    np_end = time.time()
    numpy_times.append(np_end - np_start)

    print(f"Size {size}: Python = {python_times[-1]:.5e}s, NumPy = {numpy_times[-1]:.5e}s")

# --- Histogram Plotting ---
bar_width = 0.35
x = np.arange(len(sizes))

plt.figure(figsize=(10, 6))
bars1 = plt.bar(x - bar_width/2, python_times, width=bar_width, color='steelblue', label='Pure Python')
bars2 = plt.bar(x + bar_width/2, numpy_times, width=bar_width, color='orange', label='NumPy')

# Set log scale on y-axis
plt.yscale('log')

# Add value labels above bars
for bar in bars1:
    height = bar.get_height()
    plt.text(bar.get_x() + bar.get_width()/2, height, f"{height:.1e}", ha='center', va='bottom', fontsize=8)

for bar in bars2:
    height = bar.get_height()
    plt.text(bar.get_x() + bar.get_width()/2, height, f"{height:.1e}", ha='center', va='bottom', fontsize=8)

# Labels and titles
plt.xlabel("Input Size", fontsize=12)
plt.ylabel("Execution Time (seconds, log scale)", fontsize=12)
plt.title("Systolic Bubble Sort (Pure Python vs NumPy)", fontsize=14)
plt.xticks(x, sizes)
plt.legend()
plt.grid(axis='y', linestyle='--', alpha=0.6, which='both')
plt.tight_layout()

# Save plot
plt.savefig("systolic_sort_histogram_logscale.png")
print("Histogram with log-scale saved as 'systolic_sort_histogram_logscale.png'")


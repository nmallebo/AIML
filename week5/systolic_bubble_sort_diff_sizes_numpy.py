import time
import numpy as np
import matplotlib.pyplot as plt

def systolic_bubble_sort(arr):
    """Systolic Bubble Sort implemented on a NumPy array."""
    n = len(arr)
    for t in range(n):
        if t % 2 == 0:
            for i in range(0, n - 1, 2):
                if arr[i] > arr[i + 1]:
                    arr[i], arr[i + 1] = arr[i + 1], arr[i]
        else:
            for i in range(1, n - 1, 2):
                if arr[i] > arr[i + 1]:
                    arr[i], arr[i + 1] = arr[i + 1], arr[i]
    return arr

# Input sizes to test
sizes = [10, 100, 1000, 2000]
times = []

# Run the test for each size
for size in sizes:
    data = np.random.permutation(size)  # Random unique integers
    start = time.time()
    systolic_bubble_sort(data.copy())  # Sort a copy to avoid modifying original
    end = time.time()
    elapsed = end - start
    times.append(elapsed)
    print(f"Sorted size {size} in {elapsed:.5f} seconds")

# Plot the timing results
plt.figure(figsize=(8, 5))
plt.plot(sizes, times, marker='o', linestyle='-', color='darkorange', label='Systolic Bubble Sort')
plt.title("Systolic Bubble Sort Execution Time (NumPy)")
plt.xlabel("Input Size")
plt.ylabel("Time (seconds)")
plt.grid(True)
plt.xticks(sizes)
plt.legend()

# Save plot instead of showing
plt.savefig("systolic_sort_times_numpy.png")
print("Plot saved as 'systolic_sort_times_numpy.png'")


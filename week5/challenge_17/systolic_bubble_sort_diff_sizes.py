import time
import random
import matplotlib.pyplot as plt

def systolic_bubble_sort(arr):
    """Basic systolic bubble sort implementation."""
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
sizes = [10, 100, 500, 1000, 2000, 5000]
times = []

for size in sizes:
    data = random.sample(range(size * 10), size)
    start = time.time()
    systolic_bubble_sort(data)
    end = time.time()
    times.append(end - start)
    print(f"Size: {size}, Time: {end - start:.5f}s")

# Visualization
plt.figure(figsize=(8, 5))
plt.plot(sizes, times, marker='o', linestyle='-', color='blue')
plt.title("Systolic Bubble Sort Execution Time (O(n^2))")
plt.xlabel("Input Size")
plt.ylabel("Time (seconds)")
plt.grid(True)
plt.savefig("systolic_sort_times.png")
print("Plot saved as systolic_sort_times.png")

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Load CSV file
data = pd.read_csv('timing_results.csv')

# N values (problem sizes)
N = data['N']

# Timing columns (in milliseconds)
malloc_time = data['HostMallocTime_ms']
cuda_malloc_time = data['CudaMallocTime_ms']
memcpy_h2d_time = data['MemcpyH2DTime_ms']
kernel_time = data['KernelTime_ms']
memcpy_d2h_time = data['MemcpyD2HTime_ms']
free_time = data['HostFreeTime_ms']

# Plot everything together
plt.figure(figsize=(12, 8))

# Calculate log2(N) for x-axis
log2_N = np.log2(N)

# Plot all phases
plt.plot(log2_N, malloc_time, marker='o', label='Host malloc Time')
plt.plot(log2_N, cuda_malloc_time, marker='o', label='cudaMalloc Time')
plt.plot(log2_N, memcpy_h2d_time, marker='o', label='Memcpy Host to Device Time')
plt.plot(log2_N, kernel_time, marker='o', label='Kernel Execution Time')
plt.plot(log2_N, memcpy_d2h_time, marker='o', label='Memcpy Device to Host Time')
plt.plot(log2_N, free_time, marker='o', label='Host free Time')

# Set x-axis to display powers of 2
plt.xticks(ticks=log2_N, labels=[f"$2^{{{int(i)}}}$" for i in log2_N])

# Labels and title
plt.xlabel('log2(N) (Exponent of 2)')
plt.ylabel('Time (ms)')
plt.title('CUDA SAXPY: Timing Breakdown vs log2(N)')

# Grid and legends
plt.grid(True, which="both", linestyle='--', linewidth=0.5)
plt.legend()

# Show plot and save it
plt.tight_layout()
plt.savefig('all_timings_log2_N_graph.png')
plt.show()

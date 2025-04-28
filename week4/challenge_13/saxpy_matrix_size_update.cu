#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <cuda_runtime.h>

__global__
void saxpy(int n, float a, float *x, float *y)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) y[i] = a * x[i] + y[i];
}

int main(void)
{
    FILE *fp = fopen("timing_results.csv", "w");
    if (fp == NULL) {
        printf("Failed to open file for writing!\n");
        return -1;
    }
    // CSV Header
    fprintf(fp, "Power,N,HostMallocTime_ms,CudaMallocTime_ms,MemcpyH2DTime_ms,KernelTime_ms,MemcpyD2HTime_ms,HostFreeTime_ms\n");

    for (int power = 15; power <= 25; power++) {
        int N = 1 << power;
        printf("N = 2^%d = %d elements\n", power, N);

        float *x, *y, *d_x, *d_y;

        clock_t host_start = clock();
        x = (float*)malloc(N * sizeof(float));
        y = (float*)malloc(N * sizeof(float));
        clock_t host_end = clock();
        float mallocTime = 1000.0 * (host_end - host_start) / CLOCKS_PER_SEC;

        // CUDA events
        cudaEvent_t start, stop;
        cudaEventCreate(&start);
        cudaEventCreate(&stop);

        // cudaMalloc timing
        cudaEventRecord(start);
        cudaMalloc(&d_x, N * sizeof(float)); 
        cudaMalloc(&d_y, N * sizeof(float));
        cudaEventRecord(stop);
        cudaEventSynchronize(stop);

        float cudaMallocTime = 0;
        cudaEventElapsedTime(&cudaMallocTime, start, stop);

        // Initialize host arrays
        for (int i = 0; i < N; i++) {
            x[i] = 1.0f;
            y[i] = 2.0f;
        }

        // memcpy H2D timing
        cudaEventRecord(start);
        cudaMemcpy(d_x, x, N * sizeof(float), cudaMemcpyHostToDevice);
        cudaMemcpy(d_y, y, N * sizeof(float), cudaMemcpyHostToDevice);
        cudaEventRecord(stop);
        cudaEventSynchronize(stop);

        float memcpyH2DTime = 0;
        cudaEventElapsedTime(&memcpyH2DTime, start, stop);

        // Kernel timing
        cudaEventRecord(start);
        saxpy<<<(N + 255) / 256, 256>>>(N, 2.0f, d_x, d_y);
        cudaEventRecord(stop);
        cudaEventSynchronize(stop);

        float kernelTime = 0;
        cudaEventElapsedTime(&kernelTime, start, stop);

        // memcpy D2H timing
        cudaEventRecord(start);
        cudaMemcpy(y, d_y, N * sizeof(float), cudaMemcpyDeviceToHost);
        cudaEventRecord(stop);
        cudaEventSynchronize(stop);

        float memcpyD2HTime = 0;
        cudaEventElapsedTime(&memcpyD2HTime, start, stop);

        // Check results
        float maxError = 0.0f;
        for (int i = 0; i < N; i++)
            maxError = fmax(maxError, fabs(y[i] - 4.0f));

        printf("Max error: %f\n", maxError);
        printf("Kernel Execution time: %f ms\n", kernelTime);

        // Free timing
        host_start = clock();
        cudaFree(d_x);
        cudaFree(d_y);
        free(x);
        free(y);
        host_end = clock();
        float freeTime = 1000.0 * (host_end - host_start) / CLOCKS_PER_SEC;

        // Write timings to CSV
        fprintf(fp, "%d,%d,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f\n",
                power, N,
                mallocTime,
                cudaMallocTime,
                memcpyH2DTime,
                kernelTime,
                memcpyD2HTime,
                freeTime);

        cudaEventDestroy(start);
        cudaEventDestroy(stop);

        printf("--------------------------------------\n");
    }

    fclose(fp);

    return 0;
}

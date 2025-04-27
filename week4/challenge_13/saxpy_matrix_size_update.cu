
#include <stdio.h>

__global__
void saxpy(int n, float a, float *x, float *y)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) y[i] = a * x[i] + y[i];
}

int main(void)
{
    for (int power = 15; power <= 25; power++) {
        int N = 1 << power;
        printf("N = 2^%d = %d elements\n", power, N);

        float *x, *y, *d_x, *d_y;
        x = (float*)malloc(N * sizeof(float));
        y = (float*)malloc(N * sizeof(float));

        cudaMalloc(&d_x, N * sizeof(float)); 
        cudaMalloc(&d_y, N * sizeof(float));

        for (int i = 0; i < N; i++) {
            x[i] = 1.0f;
            y[i] = 2.0f;
        }

        cudaMemcpy(d_x, x, N * sizeof(float), cudaMemcpyHostToDevice);
        cudaMemcpy(d_y, y, N * sizeof(float), cudaMemcpyHostToDevice);

        // CUDA event objects for timing
        cudaEvent_t start, stop;
        cudaEventCreate(&start);
        cudaEventCreate(&stop);

        // Start recording
        cudaEventRecord(start);

        saxpy<<<(N + 255) / 256, 256>>>(N, 2.0f, d_x, d_y);

        // Stop recording
        cudaEventRecord(stop);
        cudaEventSynchronize(stop);

        float milliseconds = 0;
        cudaEventElapsedTime(&milliseconds, start, stop);

        cudaMemcpy(y, d_y, N * sizeof(float), cudaMemcpyDeviceToHost);

        float maxError = 0.0f;
        for (int i = 0; i < N; i++)
            maxError = fmax(maxError, fabs(y[i] - 4.0f));

        printf("Max error: %f\n", maxError);
        printf("Execution time: %f ms\n", milliseconds);
        printf("Throughput: %f GFLOPS\n", (2.0 * N / (milliseconds / 1000.0)) / 1e9);
        printf("--------------------------------------\n");

        cudaEventDestroy(start);
        cudaEventDestroy(stop);
        cudaFree(d_x);
        cudaFree(d_y);
        free(x);
        free(y);
    }

    return 0;
}


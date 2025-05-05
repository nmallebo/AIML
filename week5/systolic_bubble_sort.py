def systolic_bubble_sort_verbose(arr):
    n = len(arr)
    print("Initial array:", arr)
    for t in range(n):
        phase = "Even" if t % 2 == 0 else "Odd"
        print(f"\n{phase} phase, Step {t + 1}")
        if t % 2 == 0:
            # Even-indexed comparisons
            for i in range(0, n - 1, 2):
                if arr[i] > arr[i + 1]:
                    arr[i], arr[i + 1] = arr[i + 1], arr[i]
        else:
            # Odd-indexed comparisons
            for i in range(1, n - 1, 2):
                if arr[i] > arr[i + 1]:
                    arr[i], arr[i + 1] = arr[i + 1], arr[i]
        print("Array state:", arr)
    print("\nSorted array:", arr)

# Example usage
test_data = [5, 3, 8, 4, 2, 7, 1, 6]
systolic_bubble_sort_verbose(test_data)


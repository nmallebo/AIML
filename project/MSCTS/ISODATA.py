import numpy as np
from sklearn.metrics import pairwise_distances_argmin
import matplotlib.pyplot as plt

def run_isodata(sink_coords, initial_k=4, max_iter=20, split_thresh=1.0, merge_thresh=0.5):
    """
    Perform simplified ISODATA clustering on sink coordinates.

    Parameters:
    - sink_coords: np.ndarray, shape (N, 2), sink x/y coordinates
    - initial_k: int, initial number of clusters
    - max_iter: int, maximum number of iterations
    - split_thresh: float, standard deviation threshold for splitting
    - merge_thresh: float, distance threshold for merging clusters

    Returns:
    - final_labels: np.ndarray, shape (N,), cluster assignments
    - clusters: np.ndarray, shape (M, 2), final cluster centroids
    """
    data = sink_coords
    N = len(data)

    # Step 1: Initialize cluster centers randomly
    clusters = [data[np.random.choice(N, 1)]]
    while len(clusters) < initial_k:
        clusters.append(data[np.random.choice(N, 1)])
    clusters = np.vstack(clusters)

    for iteration in range(max_iter):
        # Step 2: Assign points to nearest cluster
        labels = pairwise_distances_argmin(data, clusters)
        new_clusters = []

        for i in range(len(clusters)):
            points = data[labels == i]
            if len(points) == 0:
                continue
            mean = points.mean(axis=0)
            std = points.std()

            # Step 3: Split cluster if spread is too large
            if std > split_thresh and len(points) > 10:
                shift = np.random.randn(*mean.shape) * 0.1
                new_clusters.append(mean + shift)
                new_clusters.append(mean - shift)
            else:
                new_clusters.append(mean)

        # Step 4: Merge clusters that are close together
        merged_clusters = []
        skip = set()
        for i in range(len(new_clusters)):
            if i in skip:
                continue
            for j in range(i + 1, len(new_clusters)):
                if np.linalg.norm(new_clusters[i] - new_clusters[j]) < merge_thresh:
                    mean = (new_clusters[i] + new_clusters[j]) / 2
                    merged_clusters.append(mean)
                    skip.update([i, j])
                    break
            else:
                if i not in skip:
                    merged_clusters.append(new_clusters[i])

        clusters = np.vstack(merged_clusters)

    # Final assignment
    final_labels = pairwise_distances_argmin(data, clusters)
    return final_labels, clusters


# ====== Example Usage ======
if __name__ == "__main__":
    # Generate synthetic sink data (replace with real coordinates)
    from sklearn.datasets import make_blobs
    np.random.seed(42)
    data, _ = make_blobs(n_samples=500, centers=4, cluster_std=0.6)

    # Run ISODATA
    labels, centers = run_isodata(data, initial_k=4, max_iter=20)

    # Plot result
    plt.figure(figsize=(8, 6))
    plt.scatter(data[:, 0], data[:, 1], c=labels, s=10, cmap='viridis')
    plt.scatter(centers[:, 0], centers[:, 1], c='red', marker='x', s=100, label='Centroids')
    plt.title("ISODATA Clustering (Simplified)")
    plt.legend()
    plt.grid(True)
    plt.show()


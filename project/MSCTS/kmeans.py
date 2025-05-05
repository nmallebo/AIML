import numpy as np
from sklearn.metrics import pairwise_distances_argmin_min

def weight_balanced_kmeans(sink_coords, sink_weights, num_clusters, max_iter=100, tol=1e-4):
    """
    sink_coords: (N, 2) array of (x, y) coordinates for sinks
    sink_weights: (N,) array of pin capacitance weights
    num_clusters: number of tap drivers / clusters to form
    Returns: (labels, cluster_centers)
    """
    N = sink_coords.shape[0]
    W_total = np.sum(sink_weights)
    w_min = 0.9 * (W_total / num_clusters)
    w_max = 1.1 * (W_total / num_clusters)

    # Initialize cluster centers randomly
    rng = np.random.default_rng()
    centers = sink_coords[rng.choice(N, num_clusters, replace=False)]

    for _ in range(max_iter):
        # Compute distances and sort all (sink, cluster) pairs
        dists = np.linalg.norm(sink_coords[:, np.newaxis, :] - centers[np.newaxis, :, :], axis=-1)
        pairs = np.array(np.unravel_index(np.argsort(dists, axis=None), dists.shape)).T

        # Assign sinks greedily, balancing weights
        cluster_weights = np.zeros(num_clusters)
        labels = -np.ones(N, dtype=int)
        for sink_idx, cluster_idx in pairs:
            if labels[sink_idx] != -1:
                continue
            if cluster_weights[cluster_idx] + sink_weights[sink_idx] <= w_max:
                labels[sink_idx] = cluster_idx
                cluster_weights[cluster_idx] += sink_weights[sink_idx]

        # Recompute centers
        new_centers = np.array([
            np.average(sink_coords[labels == i], axis=0, weights=sink_weights[labels == i])
            if np.any(labels == i) else centers[i]
            for i in range(num_clusters)
        ])

        if np.linalg.norm(new_centers - centers) < tol:
            break
        centers = new_centers

    return labels, centers


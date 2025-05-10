import random
import math

def load_sink_coords_from_txt(filepath):
    """
    Loads sink coordinates from a plain text file.
    Each line should contain: x y
    """
    coords = []
    with open(filepath, 'r') as f:
        for line in f:
            if line.strip():
                x, y = map(float, line.strip().split())
                coords.append([x, y])
    return coords

def euclidean_distance(p1, p2):
    return math.sqrt(sum((a - b)**2 for a, b in zip(p1, p2)))

def mean_point(points):
    if not points:
        return [0.0, 0.0]
    dim = len(points[0])
    sums = [0.0] * dim
    for p in points:
        for i in range(dim):
            sums[i] += p[i]
    return [s / len(points) for s in sums]

def stddev_point(points, center):
    if not points:
        return 0.0
    dim = len(points[0])
    total_var = 0.0
    for p in points:
        total_var += sum((p[i] - center[i]) ** 2 for i in range(dim))
    return math.sqrt(total_var / len(points))

def run_isodata_py(sink_coords, initial_k=4, max_iter=20, split_thresh=1.0, merge_thresh=0.5):
    """
    Pure Python ISODATA clustering.
    sink_coords: List of [x, y]
    Returns: (labels: List[int], centroids: List[List[float]])
    """
    data = sink_coords[:]
    N = len(data)

    # Step 1: Random initialization
    clusters = [random.choice(data)]
    while len(clusters) < initial_k:
        clusters.append(random.choice(data))

    for _ in range(max_iter):
        # Assign points to nearest cluster
        labels = []
        for point in data:
            distances = [euclidean_distance(point, c) for c in clusters]
            labels.append(distances.index(min(distances)))
        
        # Step 2: Calculate new centroids with possible splitting
        new_clusters = []
        label_to_points = {i: [] for i in range(len(clusters))}
        for idx, label in enumerate(labels):
            label_to_points[label].append(data[idx])
        
        for i, cluster_points in label_to_points.items():
            if not cluster_points:
                continue
            center = mean_point(cluster_points)
            spread = stddev_point(cluster_points, center)
            if spread > split_thresh and len(cluster_points) > 10:
                shift = [random.uniform(-0.1, 0.1) for _ in center]
                new_clusters.append([center[j] + shift[j] for j in range(len(center))])
                new_clusters.append([center[j] - shift[j] for j in range(len(center))])
            else:
                new_clusters.append(center)

        # Step 3: Merge clusters that are too close
        merged_clusters = []
        skip = set()
        for i in range(len(new_clusters)):
            if i in skip:
                continue
            merged = False
            for j in range(i + 1, len(new_clusters)):
                if euclidean_distance(new_clusters[i], new_clusters[j]) < merge_thresh:
                    mean = [(a + b) / 2 for a, b in zip(new_clusters[i], new_clusters[j])]
                    merged_clusters.append(mean)
                    skip.add(j)
                    merged = True
                    break
            if not merged:
                merged_clusters.append(new_clusters[i])

        clusters = merged_clusters

    # Final assignment
    final_labels = []
    for point in data:
        distances = [euclidean_distance(point, c) for c in clusters]
        final_labels.append(distances.index(min(distances)))

    return final_labels, clusters

# ========== MAIN EXECUTION ==========
if __name__ == "__main__":
    # Load sink coordinates from text file
    filepath = "ff_loc"  # Replace with your file path if different
    sink_coords = load_sink_coords_from_txt(filepath)

    # Run ISODATA clustering
    labels, centers = run_isodata_py(sink_coords, initial_k=4)

    # Print results
    for i, center in enumerate(centers):
        print(f"Cluster {i}: centroid = {center}")


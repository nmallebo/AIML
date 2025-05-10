import random
import math
import matplotlib.pyplot as plt

def load_sink_coords_from_txt(filepath):
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
    data = sink_coords[:]
    N = len(data)

    clusters = [random.choice(data)]
    while len(clusters) < initial_k:
        clusters.append(random.choice(data))

    for _ in range(max_iter):
        labels = []
        for point in data:
            distances = [euclidean_distance(point, c) for c in clusters]
            labels.append(distances.index(min(distances)))
        
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

    final_labels = []
    for point in data:
        distances = [euclidean_distance(point, c) for c in clusters]
        final_labels.append(distances.index(min(distances)))

    return final_labels, clusters

# === MAIN ===
if __name__ == "__main__":
    filepath = "ff_loc"  # Change this if your file name differs
    sink_coords = load_sink_coords_from_txt(filepath)

    # Run ISODATA clustering
    labels, centers = run_isodata_py(sink_coords, initial_k=4)

    # --- Plotting ---
    xs, ys = zip(*sink_coords)
    cx, cy = zip(*centers)

    plt.figure(figsize=(8, 6))
    num_clusters = len(centers)
    colors = plt.cm.get_cmap("tab10", num_clusters)

    for i in range(num_clusters):
        cluster_points = [sink_coords[j] for j in range(len(sink_coords)) if labels[j] == i]
        cluster_xs, cluster_ys = zip(*cluster_points)
        plt.scatter(cluster_xs, cluster_ys, s=10, color=colors(i), label=f"Cluster {i}")

    plt.scatter(cx, cy, c='black', marker='x', s=100, label="Centroids")
    plt.xlabel("X")
    plt.ylabel("Y")
    plt.title("ISODATA Clustering of Sink Locations")
    plt.grid(True)
    plt.legend()
    plt.tight_layout()
    plt.savefig("isodata_clusters.png", dpi=300)
    print("Plot saved as 'isodata_clusters.png'")
    # Uncomment below if you also want to view it interactively
    # plt.show()

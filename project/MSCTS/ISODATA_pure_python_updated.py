def load_sink_coords_from_txt(filepath):
    coords = []
    with open(filepath, 'r') as f:
        for line in f:
            if line.strip():
                x, y = map(float, line.strip().split())
                coords.append([x, y])
    return coords

def sqrt_newton(x, iterations=10):
    if x == 0:
        return 0.0
    guess = x / 2.0
    for _ in range(iterations):
        guess = 0.5 * (guess + x / guess)
    return guess

def euclidean_distance(p1, p2):
    dx = p1[0] - p2[0]
    dy = p1[1] - p2[1]
    return sqrt_newton(dx * dx + dy * dy)

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
        for i in range(dim):
            total_var += (p[i] - center[i]) ** 2
    return sqrt_newton(total_var / len(points))

# Simple deterministic random using LCG
class LCG:
    def __init__(self, seed=12345):
        self.mod = 2**31
        self.a = 1103515245
        self.c = 12345
        self.state = seed

    def randint(self, low, high):
        self.state = (self.a * self.state + self.c) % self.mod
        return low + (self.state % (high - low))

    def uniform_shift(self):
        self.state = (self.a * self.state + self.c) % self.mod
        return ((self.state % 1000) / 1000.0) * 0.2 - 0.1  # Range [-0.1, 0.1]

def run_isodata_py(sink_coords, initial_k=4, max_iter=20, split_thresh=1.0, merge_thresh=0.5):
    data = sink_coords[:]
    N = len(data)
    rng = LCG(42)

    # Step 1: Deterministic initialization
    clusters = [data[rng.randint(0, N)] for _ in range(initial_k)]

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
                shift = [rng.uniform_shift() for _ in center]
                new_clusters.append([center[j] + shift[j] for j in range(len(center))])
                new_clusters.append([center[j] - shift[j] for j in range(len(center))])
            else:
                new_clusters.append(center)

        # Step 3: Merge close clusters
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

# === MAIN ===
if __name__ == "__main__":
    filepath = "ff_loc"
    sink_coords = load_sink_coords_from_txt(filepath)
    labels, centers = run_isodata_py(sink_coords, initial_k=4)

    for i, center in enumerate(centers):
        print(f"Cluster {i}: centroid = {center}")


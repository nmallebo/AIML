import matplotlib.pyplot as plt
import random

# Custom square root using Newton-Raphson method
def sqrt_newton(x, tolerance=1e-10, max_iterations=100):
    if x < 0:
        raise ValueError("Cannot compute square root of negative number.")
    if x == 0:
        return 0

    guess = x / 2.0
    for _ in range(max_iterations):
        new_guess = 0.5 * (guess + x / guess)
        if abs(new_guess - guess) < tolerance:
            return new_guess
        guess = new_guess
    return guess

def load_points_from_file(filename):
    with open(filename, 'r') as f:
        lines = f.readlines()
    points = [tuple(map(float, line.strip().split())) for line in lines if line.strip()]
    return points

def distance_2point(x1, y1, x2, y2):
    return sqrt_newton((x2 - x1) ** 2 + (y2 - y1) ** 2)

def volume_estimation(cluster, center):
    return sum(distance_2point(center[0], center[1], p[0], p[1]) for p in cluster) / len(cluster)

def new_cluster_centers(cluster):
    s = list(map(sum, zip(*cluster)))
    return (s[0]/len(cluster), s[1]/len(cluster))

def center_distance(centers):
    D_ij = {}
    for i in range(len(centers)):
        for j in range(i + 1, len(centers)):
            D_ij[(i, j)] = distance_2point(centers[i][0], centers[i][1], centers[j][0], centers[j][1])
    return D_ij

def standart_deviation(values, center):
    n = len(values)
    x_var = sum((p[0] - center[0]) ** 2 for p in values) / n
    y_var = sum((p[1] - center[1]) ** 2 for p in values) / n
    return (sqrt_newton(x_var), sqrt_newton(y_var))

def cluster_points_distribution(centers, points):
    clusters = [[] for _ in centers]
    for p in points:
        dists = [distance_2point(c[0], c[1], p[0], p[1]) for c in centers]
        min_idx = dists.index(min(dists))
        clusters[min_idx].append(p)
    return clusters

def cluster_division(cluster, center, dev_vector, k=0.5):
    max_dev = max(dev_vector)
    idx = dev_vector.index(max_dev)
    offset = k * max_dev
    center1 = list(center)
    center2 = list(center)
    center1[idx] += offset
    center2[idx] -= offset
    return tuple(center1), tuple(center2)

def cluster_union(cluster1, cluster2, center1, center2):
    n1, n2 = len(cluster1), len(cluster2)
    x = (n1 * center1[0] + n2 * center2[0]) / (n1 + n2)
    y = (n1 * center1[1] + n2 * center2[1]) / (n1 + n2)
    return (x, y), cluster1 + cluster2

def clusterize(points):
    K = 3
    THETA_N = 1
    THETA_S = 50
    THETA_C = 20
    L = 3
    I = 20
    N_c = 1

    centers = [points[0]]
    iteration = 1

    while iteration <= I:
        clusters = cluster_points_distribution(centers, points)

        # Eliminate small clusters
        valid_clusters = []
        valid_centers = []
        for i, cluster in enumerate(clusters):
            if len(cluster) >= THETA_N:
                valid_clusters.append(cluster)
                valid_centers.append(new_cluster_centers(cluster))
        clusters = valid_clusters
        centers = valid_centers

        # Volume estimation
        volumes = [volume_estimation(clusters[i], centers[i]) for i in range(len(centers))]

        # Overall average distance
        if len(clusters) <= 1:
            D = 0
        else:
            weighted_sum = sum(len(clusters[i]) * volumes[i] for i in range(len(clusters)))
            D = weighted_sum / len(points)

        # Standard deviation
        deviations = [standart_deviation(clusters[i], centers[i]) for i in range(len(centers))]

        # Cluster splitting
        new_centers = []
        for i in range(len(centers)):
            max_dev = max(deviations[i])
            if (max_dev > THETA_S and
                (volumes[i] > D and len(clusters[i]) > 2 * (THETA_N + 1) or N_c < K/2)):
                c1, c2 = cluster_division(clusters[i], centers[i], deviations[i])
                new_centers.extend([c1, c2])
                N_c += 1
            else:
                new_centers.append(centers[i])
        centers = new_centers

        # Cluster merging
        dists = center_distance(centers)
        merged = set()
        new_centers = []
        used = set()

        for (i, j), dist in sorted(dists.items(), key=lambda x: x[1]):
            if dist < THETA_C and i not in used and j not in used:
                cluster_i = clusters[i]
                cluster_j = clusters[j]
                merged_center, _ = cluster_union(cluster_i, cluster_j, centers[i], centers[j])
                new_centers.append(merged_center)
                used.update([i, j])
                N_c -= 1

        for i in range(len(centers)):
            if i not in used:
                new_centers.append(centers[i])

        centers = new_centers
        iteration += 1

    final_clusters = cluster_points_distribution(centers, points)
    return final_clusters

def plot_clusters(clusters, filename='isodata_clusters.png'):
    colors = [(random.random(), random.random(), random.random()) for _ in clusters]

    plt.figure(figsize=(8, 6))

    for idx, (cluster, color) in enumerate(zip(clusters, colors)):
        xs, ys = zip(*cluster)
        plt.scatter(xs, ys, color=color, alpha=0.6)

        # Plot centroid
        cx = sum(xs) / len(xs)
        cy = sum(ys) / len(ys)
        plt.scatter(cx, cy, color='black', marker='x', s=100, linewidths=2)

    plt.title('ISODATA Clustering with Centroids')
    plt.xlabel('X Coordinate')
    plt.ylabel('Y Coordinate')
    plt.grid(True)
    plt.savefig(filename)
    plt.close()
    print(f"Plot saved to '{filename}'.")

# Main
if __name__ == "__main__":
    filename = 'seq_loc.txt'  # Replace with your filename
    points = load_points_from_file(filename)
    clusters = clusterize(points)
    plot_clusters(clusters)


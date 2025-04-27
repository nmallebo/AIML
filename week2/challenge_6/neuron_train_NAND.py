import numpy as np

# NAND gate inputs and outputs
X = np.array([[0,0],[0,1],[1,0],[1,1]])
y = np.array([1,1,1,0])  # NAND outputs

# Initialize weights and bias
weights = np.zeros(2)
bias = 0
learning_rate = 0.1
epochs = 10

# Training loop
for epoch in range(epochs):
    for i in range(len(X)):
        linear_output = np.dot(X[i], weights) + bias
        y_pred = 1 if linear_output >= 0 else 0
        error = y[i] - y_pred
        weights += learning_rate * error * X[i]
        bias += learning_rate * error

print(f"Trained weights: {weights}, Bias: {bias}")


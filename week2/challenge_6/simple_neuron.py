import math

class SimpleNeuron:
    def __init__(self, w1, w2, bias):
        self.w1 = w1
        self.w2 = w2
        self.bias = bias

    def sigmoid(self, z):
        return 1 / (1 + math.exp(-z))

    def forward(self, x1, x2):
        z = self.w1 * x1 + self.w2 * x2 + self.bias
        output = self.sigmoid(z)
        return output

# Example usage:
if __name__ == "__main__":
    neuron = SimpleNeuron(w1=0.5, w2=-0.75, bias=0.1)
    x1 = 2.0
    x2 = -1.0
    output = neuron.forward(x1, x2)
    print(f"Neuron output: {output}")


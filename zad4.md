```python
import matplotlib.pyplot as plt
import numpy as np
import networkx as nx

class Neuron:
    def __init__(self, n_inputs, bias=0., weights=None):
        self.b = bias
        if weights is not None:
            self.ws = np.array(weights)
        else:
            self.ws = np.random.rand(n_inputs)

    def _f(self, x):  # Activation function (here: leaky_relu)
        return max(x * .1, x)

    def __call__(self, xs):  #calculate the neuron's output: multiply the inputs with the weights and sum the values together, add the bias value,
                            # then transform the value via an activation function
        return self._f(xs @ self.ws + self.b)

class Layer:
    def __init__(self, n_neurons, n_inputs):
        self.neurons = [Neuron(n_inputs) for _ in range(n_neurons)]

    def __call__(self, xs):
        return np.array([neuron(xs) for neuron in self.neurons])


class NeuralNetwork:
    def __init__(self, layer_sizes):
        self.layers = []
        for i in range(len(layer_sizes) - 1):
            self.layers.append(Layer(layer_sizes[i + 1], layer_sizes[i]))

    def __call__(self, xs):
        for layer in self.layers:
            xs = layer(xs)
        return xs


def visualize_network(layer_sizes):
    G = nx.DiGraph()
    pos = {}
    layer_positions = []
    max_layer_size = max(layer_sizes)
    #creating layers
    for i, layer_size in enumerate(layer_sizes):
        layer_positions.append([])
        vertical_offset = (max_layer_size - layer_size) / 2
        for j in range(layer_size):
            node_id = f'Layer:{i} \nNeuron:{j}'
            G.add_node(node_id)
            pos[node_id] = (i, -(j + vertical_offset))
            layer_positions[i].append(node_id)
    #creating edges
    for i in range(len(layer_sizes) - 1):
        for source in layer_positions[i]:
            for target in layer_positions[i + 1]:
                G.add_edge(source, target)
    #drawing graph
    nx.draw(G,
            pos,
            with_labels=True,
            node_size=3000,
            node_color='skyblue',
            font_size=10,
            arrowsize=15)
    plt.show()


#input layer (3 neurons), two hidden layers (4 neurons each), one output layer (1 neuron)
layer_sizes = [3, 4, 4, 1]
network = NeuralNetwork(layer_sizes)
visualize_network(layer_sizes)
```

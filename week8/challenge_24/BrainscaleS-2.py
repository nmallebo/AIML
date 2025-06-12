from _static.common.helpers import setup_hardware_client
setup_hardware_client()
import pynn_brainscales.brainscales2 as pynn

pynn.setup()
neurons_1 = pynn.Population(2, pynn.cells.HXNeuron())
neurons_2 = pynn.Population(3, pynn.cells.HXNeuron())
pynn.Projection(neurons_1, neurons_2, pynn.AllToAllConnector())
pynn.run(0.2)
pynn.end()

import torch
import torch.nn as nn
import torch.nn.functional as F

class SubtreeLatencyCNN(nn.Module):
    def __init__(self):
        super().__init__()
        # 3 maps: sink count (2 channels), capacitance, whitespace
        self.conv_layers = nn.Sequential(
            nn.Conv2d(4, 16, kernel_size=3, padding=1),  # Input has 4 channels
            nn.ReLU(),
            nn.Conv2d(16, 32, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.Conv2d(32, 64, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.Conv2d(64, 64, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.Conv2d(64, 64, kernel_size=3, padding=1),
            nn.ReLU()
        )
        self.fc1 = nn.Linear(64 * 32 * 32 + 2, 128)  # Assuming 32×32 map
        self.fc2 = nn.Linear(128, 64)
        self.fc3 = nn.Linear(64, 32)
        self.fc4 = nn.Linear(32, 1)

    def forward(self, maps, num_features):
        """
        maps: (batch_size, 4, H, W) tensor (2 sink maps + 1 capacitance + 1 whitespace)
        num_features: (batch_size, 2) tensor (grid size, variance)
        """
        x = self.conv_layers(maps)
        x = x.view(x.size(0), -1)
        x = torch.cat([x, num_features], dim=1)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = F.relu(self.fc3(x))
        return self.fc4(x).squeeze(-1)  # output: (batch_size,)


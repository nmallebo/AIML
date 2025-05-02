import numpy as np
import random
import matplotlib.pyplot as plt
import torch
import torch.nn as nn
import torch.optim as optim

# --- Environment Setup ---
class CTSEnv:
    def __init__(self, size=5):
        self.size = size
        self.state = np.zeros((size, size))
        self.buffer_penalty = -1  # Small penalty for inserting a buffer
        self.reward_target = 20   # Reward for completing

    def reset(self):
        self.state = np.zeros((self.size, self.size))
        return self.state.flatten()

    def step(self, action):
        x = action // self.size
        y = action % self.size
        done = False
        reward = self.buffer_penalty

        if self.state[x, y] == 0:
            self.state[x, y] = 1
            reward = self.reward_target
            done = True  # After successful buffer insert, end episode
        return self.state.flatten(), reward, done

    def action_space(self):
        return self.size * self.size

    def state_space(self):
        return self.size * self.size

# --- DQN Network ---
class DQN(nn.Module):
    def __init__(self, state_size, action_size):
        super(DQN, self).__init__()
        self.fc1 = nn.Linear(state_size, 64)
        self.fc2 = nn.Linear(64, 64)
        self.fc3 = nn.Linear(64, action_size)

    def forward(self, x):
        x = torch.relu(self.fc1(x))
        x = torch.relu(self.fc2(x))
        x = self.fc3(x)
        return x

# --- Training ---
def train():
    env = CTSEnv(size=5)
    state_size = env.state_space()
    action_size = env.action_space()

    model = DQN(state_size, action_size)
    optimizer = optim.Adam(model.parameters(), lr=0.001)
    criterion = nn.MSELoss()

    episodes = 500
    gamma = 0.9
    epsilon = 1.0
    epsilon_min = 0.01
    epsilon_decay = 0.995

    rewards = []

    for ep in range(episodes):
        state = env.reset()
        state = torch.FloatTensor(state)

        total_reward = 0
        done = False

        while not done:
            if random.random() < epsilon:
                action = random.randrange(action_size)
            else:
                with torch.no_grad():
                    q_values = model(state)
                    action = q_values.argmax().item()

            next_state, reward, done = env.step(action)
            next_state = torch.FloatTensor(next_state)

            # Compute target
            with torch.no_grad():
                target = reward
                if not done:
                    target += gamma * model(next_state).max().item()

            current = model(state)[action]
            # ? Fix dtype mismatch by specifying float dtype
            target_tensor = torch.tensor(target, dtype=torch.float)

            loss = criterion(current, target_tensor)

            optimizer.zero_grad()
            loss.backward()
            optimizer.step()

            state = next_state
            total_reward += reward

        epsilon = max(epsilon_min, epsilon_decay * epsilon)
        rewards.append(total_reward)

        if (ep + 1) % 50 == 0:
            print(f"Episode {ep+1}/{episodes}, Total Reward: {total_reward}, Epsilon: {epsilon:.3f}")

    # --- Plotting ---
    plt.plot(rewards)
    plt.xlabel('Episode')
    plt.ylabel('Total Reward')
    plt.title('CTS Optimization Training Rewards')
    plt.grid(True)
    plt.savefig("training_rewards.png")
    print("Plot saved as training_rewards.png")
#    plt.show()

if __name__ == "__main__":
    train()


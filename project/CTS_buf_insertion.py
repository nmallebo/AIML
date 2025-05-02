# Install necessary packages if you haven't already
# pip install numpy gym matplotlib

import numpy as np
import gym
from gym import spaces
import random
import matplotlib.pyplot as plt

# Step 1: Create a Custom CTS Environment
class CTSEnvironment(gym.Env):
    def __init__(self):
        super(CTSEnvironment, self).__init__()
        
        self.grid_size = 10  # 10x10 grid
        self.state = np.zeros((self.grid_size, self.grid_size))
        
        # Action: Insert buffer at any cell
        self.action_space = spaces.Discrete(self.grid_size * self.grid_size)
        
        # Observation: Current grid state
        self.observation_space = spaces.Box(low=0, high=1, shape=(self.grid_size, self.grid_size), dtype=np.float32)
        
        self.steps = 0
        self.max_steps = 20  # Max buffer insertions allowed

    def reset(self):
        self.state = np.zeros((self.grid_size, self.grid_size))
        self.steps = 0
        return self.state

    def step(self, action):
        row = action // self.grid_size
        col = action % self.grid_size
        
        if self.state[row, col] == 0:
            self.state[row, col] = 1  # Insert buffer
        
        self.steps += 1
        
        # Reward is negative skew (standard deviation across grid)
        row_load = np.sum(self.state, axis=1)
        col_load = np.sum(self.state, axis=0)
        skew_penalty = np.std(row_load) + np.std(col_load)
        reward = -skew_penalty
        
        done = self.steps >= self.max_steps
        return self.state, reward, done, {}

    def render(self, mode='human'):
        plt.figure(figsize=(8,8))
        plt.imshow(self.state, cmap='Greys', interpolation='nearest')
        plt.title('Final Buffer Insertions after RL Training', fontsize=16)
        plt.xlabel('X Coordinate')
        plt.ylabel('Y Coordinate')
        plt.colorbar(label='Buffer (0 = none, 1 = inserted)')
        plt.show()

# Step 2: Simple Q-Learning Agent
class QLearningAgent:
    def __init__(self, env, learning_rate=0.1, discount_factor=0.95, epsilon=1.0, epsilon_decay=0.995, epsilon_min=0.1):
        self.env = env
        self.q_table = np.zeros((env.action_space.n,))  # Q-value for each action
        self.lr = learning_rate
        self.gamma = discount_factor
        self.epsilon = epsilon
        self.epsilon_decay = epsilon_decay
        self.epsilon_min = epsilon_min

    def choose_action(self, state):
        if np.random.rand() < self.epsilon:
            return self.env.action_space.sample()
        else:
            return np.argmax(self.q_table)

    def learn(self, action, reward):
        best_future = np.max(self.q_table)
        self.q_table[action] = self.q_table[action] + self.lr * (reward + self.gamma * best_future - self.q_table[action])

    def decay_epsilon(self):
        self.epsilon = max(self.epsilon * self.epsilon_decay, self.epsilon_min)

# Step 3: Train the RL Agent
env = CTSEnvironment()
agent = QLearningAgent(env)

episodes = 500
reward_history = []

for episode in range(episodes):
    state = env.reset()
    total_reward = 0
    done = False

    while not done:
        action = agent.choose_action(state)
        next_state, reward, done, info = env.step(action)
        agent.learn(action, reward)
        state = next_state
        total_reward += reward

    agent.decay_epsilon()
    reward_history.append(total_reward)
    
    if episode % 50 == 0:
        print(f"Episode {episode}: Total Reward: {total_reward:.2f}")

# Step 4: Plot Reward over Episodes
plt.figure(figsize=(10,6))
plt.plot(reward_history, label="Total Reward per Episode", color='blue')
plt.xlabel('Episode', fontsize=14)
plt.ylabel('Total Reward', fontsize=14)
plt.title('RL Agent Learning Progress (Clock Buffer Insertion)', fontsize=16)
plt.grid(True)
plt.legend()
plt.show()

# Step 5: Test the Trained Agent and Show Final Grid
state = env.reset()
done = False
while not done:
    action = agent.choose_action(state)
    next_state, reward, done, info = env.step(action)
    state = next_state

env.render()


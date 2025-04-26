# -*- coding: -*-
"""
Created on Sat Apr 26 2020

Q-Learnig Algorithm GPU implementation on frozen lake concept

@author: Nageswararao Malleboina - 950298865
"""

import torch
import numpy as np
import random
import matplotlib.pyplot as plt

# Set device (CPU or GPU)
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# Board dimensions
BOARD_ROWS = 5
BOARD_COLS = 5
NUM_ACTIONS = 4

START = (0, 0)
WIN_STATE = (4, 4)
HOLE_STATE = [(1,0),(3,1),(4,2),(1,3)]

# Define the environment
class State:
    def __init__(self, state=START):
        self.state = state
        self.isEnd = False

    def getReward(self):
        if self.state in HOLE_STATE:
            return -5
        elif self.state == WIN_STATE:
            return 1
        else:
            return -1

    def isEndFunc(self):
        if self.state == WIN_STATE or self.state in HOLE_STATE:
            self.isEnd = True

    def nxtPosition(self, action):
        x, y = self.state
        if action == 0:  # up
            x -= 1
        elif action == 1:  # down
            x += 1
        elif action == 2:  # left
            y -= 1
        elif action == 3:  # right
            y += 1
        if 0 <= x < BOARD_ROWS and 0 <= y < BOARD_COLS:
            return (x, y)
        return self.state

# Define the agent
class Agent:
    def __init__(self):
        self.actions = torch.arange(NUM_ACTIONS, device=device)  # [0,1,2,3]
        self.alpha = 0.5
        self.gamma = 0.9
        self.epsilon = 0.1

        self.State = State()
        self.isEnd = self.State.isEnd

        self.rewards = 0
        self.plot_reward = []

        # Initialize Q-table (shape: rows x cols x actions)
        self.Q = torch.zeros((BOARD_ROWS, BOARD_COLS, NUM_ACTIONS), device=device)

    def Action(self):
        i, j = self.State.state
        if random.random() > self.epsilon:
            # Exploit
            q_values = self.Q[i, j]
            action = torch.argmax(q_values).item()
        else:
            # Explore
            action = random.choice(range(NUM_ACTIONS))
        next_state = self.State.nxtPosition(action)
        return next_state, action

    def Q_Learning(self, episodes):
        for ep in range(episodes):
            if self.isEnd:
                reward = self.State.getReward()
                self.rewards += reward
                self.plot_reward.append(self.rewards)

                i, j = self.State.state
                self.Q[i, j, :] = reward

                # Reset
                self.State = State()
                self.isEnd = self.State.isEnd
                self.rewards = 0
            else:
                next_state, action = self.Action()
                i, j = self.State.state
                ni, nj = next_state

                reward = self.State.getReward()
                self.rewards += reward

                # Q-learning update
                max_next_Q = torch.max(self.Q[ni, nj])
                target = reward + self.gamma * max_next_Q
                self.Q[i, j, action] = (1 - self.alpha) * self.Q[i, j, action] + self.alpha * target

                # Move to next state
                self.State = State(state=next_state)
                self.State.isEndFunc()
                self.isEnd = self.State.isEnd

    def plot(self, episodes):
        plt.plot(self.plot_reward)
        plt.title(f'Reward vs Episodes ({episodes})')
        plt.xlabel('Episodes')
        plt.ylabel('Cumulative Reward')
        plt.show()

    def showValues(self):
        for i in range(BOARD_ROWS):
            print('-----------------------------------------------')
            out = '| '
            for j in range(BOARD_COLS):
                max_value = torch.max(self.Q[i, j]).item()
                out += str(round(max_value,3)).ljust(6) + ' | '
            print(out)
        print('-----------------------------------------------')

if __name__ == "__main__":
    ag = Agent()
    episodes = 10000
    ag.Q_Learning(episodes)
    ag.plot(episodes)
    ag.showValues()


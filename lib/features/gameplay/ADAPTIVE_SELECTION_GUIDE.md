# Adaptive Difficulty & Intelligent Question Selection

## Overview
This engine is responsible for curating the learning experience in Soteria. It ensures that questions are served at the optimal difficulty level for the player, preventing boredom (too easy) or frustration (too hard).

## Selection Strategies
- **Adaptive**: Real-time adjustment based on accuracy and response speed. Used in Practice mode.
- **Deterministic**: Fixed sequence for all participants to ensure fairness. Used in Tournaments.
- **Linear**: Follows a specific curriculum path. Used for Mock Exams.
- **Random**: Curated pool with randomized selection.

## Core Components

### 1. Difficulty Engine
Calculates the next suggested difficulty based on the player's recent performance.
- Correct + Fast response -> Increase difficulty.
- Incorrect response -> Decrease difficulty.

### 2. Player Skill Estimator
Maintains a dynamic model of the player's capabilities, including:
- Overall Accuracy
- Average Response Time
- Knowledge Rating (Elo-like)
- Category Strengths

### 3. Category Balancer
Ensures players are exposed to a broad range of topics within a session, preventing the overuse of any single subject.

## Implementation Details
The engine is server-ready. While the initial implementation uses a `MockSelectionRepository`, the architecture is designed to call external APIs or Firebase functions for official competitive selection.

## Developer Tools
Use the **Developer UI Studio** to preview different difficulty badges and simulate adaptive progression flows.

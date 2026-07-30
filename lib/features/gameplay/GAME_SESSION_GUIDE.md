# Soteria Game Session & Match Flow Engine

## Overview
The Game Session Engine orchestrates the entire lifecycle of a gameplay match, from initialization to completion and results. It acts as a single source of truth, coordinating the Question Engine, Knowledge Assists, and Timer.

## Session Lifecycle
1.  **Initializing**: Setting up session ID and basic match parameters.
2.  **Loading Questions**: Fetching data from the `QuestionRepository`.
3.  **Countdown**: A pre-game 3-2-1-GO overlay to prepare the player.
4.  **Active**: The main gameplay loop where questions are presented and answered.
5.  **Paused**: Match is suspended; timers are halted.
6.  **Interrupted**: Unexpected exit or crash; session can be recovered via the Checkpoint System.
7.  **Completed**: Final results calculated and displayed.

## Checkpoint & Recovery System
The engine automatically saves a checkpoint of the `GameSession` state whenever a significant event occurs (question answered, match paused).
- **Auto-save**: Persists `currentQuestion`, `currentScore`, `elapsedTime`, and `assistUsage`.
- **Recovery**: On app restart, the `GameSessionController` checks for existing checkpoints to offer a "Resume" prompt.

## Anti-Cheat Foundation
The architecture is designed to be server-authoritative:
- All answer validations and score calculations are prepared for move to a backend implementation.
- `lastCheckpointTime` and `elapsedTime` help verify session integrity.

## Analytics Integration
Standardized events are logged for all lifecycle transitions:
- `Session Started`
- `Session Paused`
- `Session Completed`
- `Session Abandoned`
- `Session Recovered`

## Developer Integration
Use the `MatchFlowScreen` to wrap any gameplay mode.
```dart
MatchFlowScreen(mode: 'practice')
```
Register new gameplay UI states in the Developer UI Studio for visual verification.

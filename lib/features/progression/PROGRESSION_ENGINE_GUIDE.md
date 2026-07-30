# Soteria Progression Engine

## Overview
The Progression Engine is responsible for calculating scores, XP, levels, streaks, and reputation. It is designed to be configuration-driven and reusable across all game modes.

## Core Entities
- `PlayerProgression`: Tracks the current state of a player (Level, XP, Streaks, Reputation).
- `ProgressionProfile`: Mode-specific configurations (Point values, multipliers).
- `Achievement`: Definitions of milestones.
- `Reward`: Item or currency granted to players.

## Logic Flow
1. **Action Triggered**: A question is answered correctly in `Practice` mode.
2. **Controller Update**: `ProgressionController.addXP` and `updateStreak` are called.
3. **Calculation**: The engine checks the mode's `ProgressionProfile` to determine multipliers.
4. **Level Up**: If `currentXP >= nextLevelXP`, the level is incremented and a `LevelUp` event is fired.
5. **Persistence**: The updated state is saved via the `ProgressionRepository`.

## Mode Configurations
Configs are loaded per-mode:
- `practice`: Base values.
- `pro`: Higher multipliers, higher risks.
- `tournament`: Maximum stakes, exclusive rewards.

## UI Components
- `LevelBadge`: Golden circular indicator of player rank.
- `XPProgressBar`: Royal Indigo progress tracker for next level.
- `RewardCard`: Showcase of earned achievements or items.

## Future Roadmap
- **Seasons**: Integration with `SeasonPass` systems.
- **Multplayer**: Real-time reputation updates during competitive matches.
- **AI**: Dynamic difficulty adjustment based on reputation and skill score.

# Soteria Knowledge Assists System

## Overview
The Knowledge Assists System provides strategic tools to players to help them navigate difficult questions. It is designed with competitive fairness in mind, ensuring all players have access to the same resources.

## Implemented Assists

### 1. Eliminate Two (🎯)
- **Effect**: Removes two incorrect options from the current question.
- **Limit**: Once per round.
- **Client/Server**: The server (or mock repository) identifies incorrect options and returns their IDs to the client.

### 2. Time Freeze (⏸)
- **Effect**: Pauses the match timer for 15 seconds.
- **Limit**: Once per round.
- **Implementation**: The `AssistController` manages a local timer and updates `isTimerFrozen` state.

### 3. Community Insight (👥)
- **Effect**: Displays historical answer statistics from other players.
- **Limit**: Once per round.
- **Fallback**: If historical data is limited, it provides simulated estimates based on question difficulty.

## Architecture

### Domain Layer
- `AssistType`: Enum for available assists.
- `AssistStatus`: Tracks if an assist is available, used, or disabled.
- `AssistUsage`: Model representing a specific use instance of an assist.

### Application Layer
- `AssistController`: Riverpod notifier managing the state of all assists in a session.
- `AssistState`: Immutable state containing current availability, timer status, and active effects.

### Data Layer
- `AssistRepository`: Abstract interface for assist validation and consumption.
- `MockAssistRepository`: Simulated server logic for testing and development.

## Security & Fairness
- **Server Authoritative**: The client requests to use an assist; the server validates availability and returns the result (e.g., which options to remove).
- **No Competitive Advantage**: Premium users do NOT receive more assists in competitive modes.

## Developer Integration
All assist components are registered in the **Developer UI Studio** for visual verification of states:
- Available
- Used
- Disabled
- Loading
- Error

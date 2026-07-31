# Multiplayer & Matchmaking Architecture

## Overview
The Soteria Multiplayer system is designed to be provider-agnostic, scalable, and modular. It separates gameplay logic from networking synchronization and supports various backends (Firebase, Supabase, Dedicated Servers) via interfaces.

## Architecture Layers

### 1. Domain Layer (`domain/`)
- **Models**: Immutable entities like `Player`, `MatchRoom`, `MatchmakingTicket`, etc.
- **Service Interfaces**: 
    - `RealtimeConnection`: Low-level socket/stream abstraction.
    - `MatchmakingService`: Handles queue entry and ticket tracking.
    - `MatchService`: Manages room state, readiness, and game state sync.
    - `PresenceService`: Tracks online status.
    - `InvitationService`: Manages friend and party invites.

### 2. Data Layer (`data/`)
- Contains concrete implementations of the domain services (e.g., `FirebaseMatchmakingService`, `WebSocketRealtimeConnection`).
- *Note: Initial implementation uses mock/placeholder logic for backend-agnostic delivery.*

### 3. Application Layer (`application/`)
- **MatchmakingEngine**: Logic for finding opponents based on criteria.
- **QueueNotifier**: Riverpod-based state management for the player's queue status and wait time.
- **ConnectionController**: Manages the lifecycle of the realtime connection.

### 4. Presentation Layer (`presentation/`)
- **SearchingForOpponent**: Full-screen radar animation for matchmaking.
- **MatchReadyDialog**: High-impact dialog when a match is found.
- **MultiplayerWidgets**: Reusable components like `OpponentCard` and `ConnectionStatusIndicator`.

## Matchmaking Flow
1. **Request**: Player triggers `joinQueue`.
2. **Ticket**: `MatchmakingService` issues a `MatchmakingTicket`.
3. **Polling/Streaming**: `QueueNotifier` watches the ticket status.
4. **Match Found**: Status changes to `completed`.
5. **Confirmation**: `MatchReadyDialog` is shown to all players.
6. **Session Start**: Upon acceptance, players move to the `MatchRoom`.

## Design Principles
- **Backend Agnostic**: All networking is hidden behind interfaces.
- **Dark Theme Only**: UI follows Soteria v2 premium dark aesthetic.
- **Performance**: Minimal rebuilds by separating queue state from global app state.
- **Resilience**: Support for reconnection and queue recovery.

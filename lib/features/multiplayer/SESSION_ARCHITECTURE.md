# Real-Time Session Management Architecture

## Lifecycle Flow
The multiplayer session follows a strict, backend-agnostic lifecycle:
1. **Created**: Matchmaking has found players and the session container is allocated.
2. **Waiting for Players**: Players are connecting to the realtime socket/stream.
3. **Ready Check**: All players must confirm readiness within the timeout.
4. **Countdown**: High-impact visual countdown synced across all clients.
5. **In Progress**: The active gameplay loop.
6. **Round Transition**: Brief pause for score synchronization and next question prep.
7. **Finished**: Final results calculated and displayed.
8. **Closed**: Cleanup and redirection.

## Synchronization Strategy
- **Authoritative State**: The backend (e.g., Firebase, Supabase) holds the master `GameSession` object.
- **Event-Driven**: Critical transitions (e.g., round start) are triggered by `SessionEvent` objects to ensure simultaneous execution.
- **Optimistic UI**: Simple state changes (like marking one-self as ready) are reflected immediately while awaiting confirmation.

## Session Recovery
If a user disconnects:
1. `ActiveSessionNotifier` detects the stream closure or connection failure.
2. The user is presented with a `ReconnectOverlay` (if within the grace period defined by `GameRules`).
3. `SessionManager.recoverSession()` attempts to re-join the authoritative session.
4. Upon re-join, the engine performs a full state sync to align the local client with the current round and timer.

## Latency & Timing
- **Time Sync**: Clients use a `ClockSynchronizer` (interface) to account for NTP offsets.
- **Latency Monitoring**: `PingService` continuously tracks RTT, which is shared via `PlayerState.latencyMs`.

## Design Implementation
- **Dark Theme Only**: Strictly follows Soteria v2 design tokens.
- **Indigo Focus**: Primary interactive elements use the brand's Indigo gradient.
- **Gold Highlights**: Reserved for winning scores and achievements in the transition views.

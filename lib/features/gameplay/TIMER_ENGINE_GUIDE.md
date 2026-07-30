# Advanced Timer & Game State Management

## Overview
The Advanced Timer Engine is a configuration-driven orchestration system that manages gameplay timing, state transitions, and synchronization. It is decoupled from UI and integrated with the Game Session and Knowledge Assists systems.

## Key Features
- **Configuration Profiles**: Define `TimerProfile` for different game modes (Practice, Pro, Tournament).
- **State Machine**: Tracks states like `Idle`, `Running`, `Paused`, `Frozen`, `Warning`, `Critical`, and `Expired`.
- **Knowledge Assist Integration**: Supports `Time Freeze` with accurate resumption.
- **Session Recovery**: Built to persist and restore timer state via the Checkpoint system.
- **Server-Authoritative Design**: Prepared for synchronization with a future backend to prevent client-side timing manipulation.

## Timer Lifecycle
1. **Initialize**: Set `TimerProfile` and `sessionId`.
2. **Start**: Ticker begins counting down from `maxDurationSeconds`.
3. **Running**: Increments `elapsedSeconds` and decrements `remainingSeconds`.
4. **Warning/Critical**: State changes automatically when thresholds are crossed.
5. **Freeze**: Timer pauses for a fixed duration, then resumes.
6. **Expire**: State becomes `Expired` when reaching zero; triggers session-level timeout logic.

## Usage

### Starting a Timer
```dart
ref.read(timerControllerProvider.notifier).initialize(
  sessionId, 
  TimerProfile(
    id: 'pro_mode',
    name: 'Professional',
    maxDurationSeconds: 60,
    warningThresholdSeconds: 15,
    criticalThresholdSeconds: 5,
  ),
);
ref.read(timerControllerProvider.notifier).start();
```

### Freezing (Assist)
```dart
ref.read(timerControllerProvider.notifier).freeze(15); // Pauses for 15s
```

## Visualization
Reusable widgets are available in `presentation/widgets/soteria_timer.dart`:
- `CircularTimer`: Radial progress with pulse effects during critical state.
- `LinearTimer`: Standard progress bar suitable for global overlays.

## Testing Strategy
- **Accuracy Tests**: Verify ticker intervals and total duration.
- **Pause/Resume Logic**: Ensure remaining time is preserved correctly.
- **State Transitions**: Validate threshold-triggered status changes (Warning/Critical).
- **Recovery Tests**: Restore timer state from a simulated checkpoint.

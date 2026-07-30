# Live Synchronization & State Replication Architecture

## Overview
The Soteria Synchronization Engine ensures all clients in a multiplayer session maintain a consistent view of the match. It uses a combination of authoritative snapshots, incremental deltas, and conflict resolution strategies.

## Core Concepts

### 1. State Replication
- **Snapshots**: Full session state sent periodically (e.g., every 5-10 seconds) or upon major transitions.
- **Deltas**: Small updates containing only changed fields (e.g., score updates, timer ticks) sent at high frequency.
- **Sequence Numbers**: Every packet has a monotonically increasing sequence number to detect out-of-order or dropped packets.

### 2. Synchronization Engine
- **Sync Scheduler**: Manages the frequency of outgoing updates and the consumption of incoming packets.
- **Replication Manager**: Orchestrates the application of snapshots and deltas to the local state.
- **State Validation**: Uses checksums to verify that the local state matches the server's state.

### 3. Conflict Resolution
When local state diverges from the server (detected via sequence gaps or checksum failures):
- **Server Wins**: Default strategy where the client discards local changes and accepts the server snapshot.
- **Timestamp Validation**: Resolves conflicts based on the most recent server-validated timestamp.
- **Sequence Priority**: Prioritizes packets with higher sequence numbers.

### 4. Latency Compensation
- **Clock Sync**: Estimating NTP/Server offset to ensure countdowns and round starts are simultaneous (±50ms).
- **Ping/Jitter Tracking**: Real-time monitoring of connection quality to adjust sync frequency or trigger recovery.

## Recovery Flow
1. **Gap Detection**: Sequence number skip detected (e.g., received 45 after 42).
2. **Buffer/Wait**: Short wait for missing packets (43, 44).
3. **Resync Trigger**: If packets remain missing, a `FullSyncRequest` is sent.
4. **Snapshot Application**: The client is locked briefly while the full state is restored.

## Design
- **Premium Indicators**: UI components like `ConnectionQualityIndicator` use Soteria v2 design tokens.
- **Efficiency**: Incremental replication minimizes data usage and CPU overhead during fast-paced matches.

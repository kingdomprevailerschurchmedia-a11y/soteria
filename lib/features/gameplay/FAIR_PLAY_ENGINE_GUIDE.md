# Fair Play & Anti-Cheat Engine

## Overview
The Fair Play & Anti-Cheat Engine ensures the integrity of competitive matches in Soteria. It implements a multi-stage validation pipeline that prioritizes server authority while maintaining a smooth local user experience.

## Validation Pipeline
1.  **Local Checks**: Immediate validation of question ID, answer format, and time limits.
2.  **Integrity Analysis**: Checks for impossible response times (e.g. < 1s) and suspicious patterns.
3.  **Audit Logging**: Every competitive action is logged with session metadata and timestamps.
4.  **Server Authority (Future)**: The architecture is designed to hand off validation to a backend service (Firebase Functions or a custom API) without UI changes.

## Core Components
- `FairPlayEngine`: Orchestrates the validation process and handles suspicious behavior flags.
- `FairPlayRepository`: Abstract interface for submitting validation requests and retrieving audit logs.
- `ValidationResult`: Detailed report of a validation attempt, including correctness, integrity score, and server signatures.
- `AuditEntry`: Permanent record of a session event for post-match review.

## Cheat Detection Heuristics
- **Speed Limit**: Flags responses that occur faster than humanly possible for the given question type.
- **Session Consistency**: Ensures session IDs and question sequences remain deterministic.
- **Replay Protection**: Prepared for nonce/signature validation to prevent resubmission of old valid answers.

## UI Components
- `FairPlayIndicator`: Real-time status of the player's session integrity (Fair Play / Reviewing / Integrity Risk).
- `IntegrityBanner`: Used for global warnings if a session is deemed invalid.

## Future Server Integration
To enable server-authoritative validation:
1. Implement `FairPlayRepository` using a network client.
2. The server should maintain a copy of the active session and validate answers against the database.
3. Use the `serverSignature` field in `ValidationResult` to verify the authenticity of the result.

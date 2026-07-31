# Soteria Gameplay Foundation Handbook

Welcome to the Soteria Gameplay Foundation. This directory contains the core engine responsible for delivering the competitive learning experience.

## Sub-Modules
- **[Question Engine](QUESTION_ENGINE_GUIDE.md)**: Manages question data and polymorphic rendering.
- **[Game Session Manager](GAME_SESSION_GUIDE.md)**: Orchestrates match lifecycles and recovery.
- **[Advanced Timer](TIMER_ENGINE_GUIDE.md)**: High-precision timing and state machine.
- **[Knowledge Assists](KNOWLEDGE_ASSISTS_GUIDE.md)**: Strategic player tools (Time Freeze, Eliminate Two).
- **[Adaptive Selection](ADAPTIVE_SELECTION_GUIDE.md)**: Intelligent difficulty scaling and category balancing.
- **[Fair Play & Anti-Cheat](FAIR_PLAY_ENGINE_GUIDE.md)**: Validation pipeline and integrity heuristics.
- **[UI & Feedback](GAMEPLAY_UI_GUIDE.md)**: Premium animations and microinteractions.

## Architecture
We follow **Feature-First Clean Architecture**.
- **Domain**: Pure business logic and entity definitions.
- **Data**: Repository implementations (currently using mock data).
- **Application**: Riverpod controllers for state management.
- **Presentation**: Polished Material 3 widgets adhering to Soteria Design Language v2.

## Security Policy
Competitive validation is **Server-Authoritative**. Local validation is provided for immediate UI feedback, but match integrity relies on server-signed results.

## Performance Targets
- **60 FPS** UI thread.
- **Zero Memory Leaks**: Tickers and providers are auto-disposed.
- **Recovery**: 100% session persistence via local checkpointing.

---
*Epic 4 Documentation — Version 1.0.0*

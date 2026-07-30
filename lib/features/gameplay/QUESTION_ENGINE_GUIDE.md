# Soteria Question Engine Architecture

## Overview
The Question Engine is the core reusable infrastructure for all gameplay modes in Soteria (Practice, Pro, Versus, etc.). It manages question loading, session state, user answers, and navigation.

## Key Components

### 1. Domain Entities
- **Question**: The core data model representing a single task.
- **QuestionType**: Enum defining interaction types (Multiple Choice, Ordering, Matching, etc.).
- **QuestionOption**: Sub-component of a question.
- **QuestionSession**: Holds the state of an active gameplay round.

### 2. Application Layer
- **QuestionController**: A Riverpod Notifier (`QuestionController`) that orchestrates the session lifecycle.
- **QuestionState**: Immutable state holding the session, loading status, and errors.
- **QuestionValidator**: Static utility for checking answer correctness.

### 3. Data Layer
- **QuestionRepository**: Abstract interface for fetching questions.
- **MockQuestionRepository**: Local implementation for development and testing.

## Question Lifecycle
1. **Initialization**: `startSession()` is called with configuration (limit, categories, difficulty).
2. **Loading**: State moves to `isLoading: true`.
3. **Active**: Questions are displayed via `QuestionRenderer`.
4. **Interaction**: User selects options; `submitAnswer()` updates the session state.
5. **Navigation**: `nextQuestion()`, `previousQuestion()`, or `jumpToQuestion()` changes the active index.
6. **Completion**: `finishSession()` calculates final stats and marks the session as completed.

## Supporting New Question Types
To add a new question type:
1. Add to `QuestionType` enum.
2. Update `QuestionRenderer` to include the new UI layout.
3. Update `QuestionValidator` with the validation logic for the new type.

## Testing Strategy
- **Unit Tests**: Test `QuestionSession` logic and `QuestionValidator`.
- **Provider Tests**: Test `QuestionController` state transitions.
- **Widget Tests**: Test `QuestionRenderer` and `OptionTile` interactions.
- **Golden Tests**: Verify the UI layout for different question types and screen sizes.

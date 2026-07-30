# Gameplay UI, Animations & Feedback

## Overview
This document describes the design principles and implementation details for the gameplay experience in Soteria. The goal is to provide a premium, responsive, and clear interface for players.

## Core Principles
- **Clarity over Clutter**: Only show essential information.
- **Confident Feedback**: Immediate visual and interactive response to every action.
- **Guided Motion**: Use animations to transition between states and highlight rewards.

## Key Components

### 1. Option Interaction (`OptionTile`)
- **Idle**: Standard state with outline.
- **Selected**: Royal Indigo highlight with subtle glow.
- **Locked**: Interactive features disabled after submission.
- **Correct/Incorrect**: Success (Green) or Error (Red) states revealed during feedback.

### 2. Feedback System (`FeedbackOverlay`)
- **Purpose**: Provides a full-screen momentary confirmation of the result.
- **Transitions**: Uses a combination of scale and opacity (300-500ms).
- **Types**: `Correct`, `Incorrect`, `Time Expired`.

### 3. Transitions
- **Question Navigation**: Smooth horizontal slide and fade when moving to the next question.
- **Reward Floating**: XP and Coins use a vertical translation and fade microinteraction to signal gains.

### 4. Timer Visualization
- **Normal**: Royal Indigo.
- **Warning**: Gold (#D8B24A).
- **Critical**: Error (Red) with a pulse animation.

## Responsive Design
- **Mobile**: Single column list of options.
- **Tablet/Desktop**: Centered content with optimized line lengths and scaled typography.

## Accessibility
- **Semantics**: Every state (Correct/Incorrect) is communicated via semantic labels.
- **Reduced Motion**: All custom animations respect the user's system preference for reduced motion.

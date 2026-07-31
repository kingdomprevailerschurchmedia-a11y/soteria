import 'package:flutter/material.dart';

/// Gameplay-specific animation constants that aren't part of the core design tokens.
class GameplayAnimations {
  /// Duration for the GO!/Number scale animation in countdown
  static const Duration countdownTick = Duration(milliseconds: 800);
  
  /// Duration for floating reward indicators (XP, Coins)
  static const Duration rewardFloating = Duration(milliseconds: 1500);
  
  /// Pause duration before feedback overlay reverses
  static const Duration feedbackHold = Duration(milliseconds: 1200);
  
  /// Offset for question slide transition
  static const Offset questionSlideOffset = Offset(0.05, 0);
}

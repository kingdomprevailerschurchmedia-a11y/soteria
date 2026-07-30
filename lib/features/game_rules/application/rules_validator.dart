import '../domain/models/game_rules.dart';

class RulesValidator {
  bool validate(GameRules rules) {
    // Check for logical inconsistencies
    if (rules.timer.minTimerSeconds > rules.timer.maxTimerSeconds) return false;
    if (rules.timer.questionTimerSeconds < rules.timer.minTimerSeconds) return false;
    if (rules.rewards.baseXP < 0) return false;
    
    // Add more validation logic as needed
    return true;
  }
}

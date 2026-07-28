import 'analytics_constants.dart';
import 'analytics_parameter.dart';

/// Base class for all application events.
abstract class AnalyticsEvent {
  const AnalyticsEvent(this.name, {this.parameters = const []});
  
  final String name;
  final List<AnalyticsParameter> parameters;

  Map<String, dynamic> toMap() {
    return {
      for (final p in parameters) p.key: p.value,
    };
  }
}

class ScreenViewedEvent extends AnalyticsEvent {
  ScreenViewedEvent(String screenName)
      : super(
          AnalyticsConstants.screenView,
          parameters: [ScreenNameParam(screenName)],
        );
}

class ButtonClickedEvent extends AnalyticsEvent {
  ButtonClickedEvent(String buttonId)
      : super(
          AnalyticsConstants.buttonClick,
          parameters: [ButtonIdParam(buttonId)],
        );
}

class QuizStartedEvent extends AnalyticsEvent {
  QuizStartedEvent(String quizId)
      : super(
          AnalyticsConstants.quizStart,
          parameters: [QuizIdParam(quizId)],
        );
}

class ErrorOccurredEvent extends AnalyticsEvent {
  ErrorOccurredEvent(String message)
      : super(
          AnalyticsConstants.errorOccur,
          parameters: [ErrorMessageParam(message)],
        );
}

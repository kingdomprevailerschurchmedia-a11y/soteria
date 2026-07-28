/// Base class for all strongly-typed analytics parameters.
abstract class AnalyticsParameter {
  const AnalyticsParameter(this.key, this.value);
  final String key;
  final Object value;
}

class ScreenNameParam extends AnalyticsParameter {
  const ScreenNameParam(String name) : super('screen_name', name);
}

class ButtonIdParam extends AnalyticsParameter {
  const ButtonIdParam(String id) : super('button_id', id);
}

class QuizIdParam extends AnalyticsParameter {
  const QuizIdParam(String id) : super('quiz_id', id);
}

class AmountParam extends AnalyticsParameter {
  const AmountParam(num amount) : super('amount', amount);
}

class ErrorMessageParam extends AnalyticsParameter {
  const ErrorMessageParam(String message) : super('error_message', message);
}

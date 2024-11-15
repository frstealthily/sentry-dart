import 'sentry_measurement_unit.dart';

class SentryMeasurement {
  SentryMeasurement(
    this.name,
    this.value, {
    this.unit,
  });

  static const totalFramesName = 'frames_total';
  static const slowFramesName = 'frames_slow';
  static const frozenFramesName = 'frames_frozen';
  static const framesDelayName = 'frames_delay';

  /// Amount of frames drawn during a transaction
  SentryMeasurement.totalFrames(this.value)
      : name = totalFramesName,
        unit = SentryMeasurementUnit.none;

  /// Amount of slow frames drawn during a transaction.
  /// A slow frame is any frame longer than 1s / refreshrate.
  /// So for example any frame slower than 16ms for a refresh rate of 60hz.
  SentryMeasurement.slowFrames(this.value)
      : name = slowFramesName,
        unit = SentryMeasurementUnit.none;

  /// Amount of frozen frames drawn during a transaction.
  /// Typically defined as frames slower than 500ms.
  SentryMeasurement.frozenFrames(this.value)
      : name = frozenFramesName,
        unit = SentryMeasurementUnit.none;

  /// Total duration of frames delayed.
  SentryMeasurement.framesDelay(this.value)
      : name = framesDelayName,
        unit = SentryMeasurementUnit.none;

  /// Duration of the Cold App start in milliseconds
  SentryMeasurement.coldAppStart(Duration duration)
      : assert(!duration.isNegative),
        name = 'app_start_cold',
        value = duration.inMilliseconds,
        unit = DurationSentryMeasurementUnit.milliSecond;

  /// Duration of the Warm App start in milliseconds
  SentryMeasurement.warmAppStart(Duration duration)
      : assert(!duration.isNegative),
        name = 'app_start_warm',
        value = duration.inMilliseconds,
        unit = DurationSentryMeasurementUnit.milliSecond;

  /// Duration of the time to initial display in milliseconds
  SentryMeasurement.timeToInitialDisplay(Duration duration)
      : assert(!duration.isNegative),
        name = 'time_to_initial_display',
        value = duration.inMilliseconds,
        unit = DurationSentryMeasurementUnit.milliSecond;

  /// Duration of the time to full display in milliseconds
  SentryMeasurement.timeToFullDisplay(Duration duration)
      : assert(!duration.isNegative),
        name = 'time_to_full_display',
        value = duration.inMilliseconds,
        unit = DurationSentryMeasurementUnit.milliSecond;

  final String name;
  final num value;
  final SentryMeasurementUnit? unit;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'value': value,
      if (unit != null) 'unit': unit?.toStringValue(),
    };
  }
}

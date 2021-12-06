import 'dart:async';
import 'dart:io';

import 'package:gherkin/gherkin.dart';

import 'steps/given_the_two_numbers.step.dart';
import 'steps/then_the_result_should_be.step.dart';
import 'steps/when_they_are_added.step.dart';
import 'worlds/calculator_word.dart';

String buildFeaturesPathRegex() {
  return 'features${Platform.pathSeparator}.*.feature';
}

Future<void> main() {
  final steps = [
    givenTheNumbers(),
    whenTheyAreAdded(),
    thenTheResultShouldBe()
  ];
  final featurePath = buildFeaturesPathRegex();
  final config = TestConfiguration.DEFAULT(steps)
    ..features = [RegExp(featurePath)]
    ..tagExpression = 'not @skip'
    ..createWorld =
        (TestConfiguration config) => Future.value(CalculatorWorld());
  return GherkinRunner().execute(config);
}

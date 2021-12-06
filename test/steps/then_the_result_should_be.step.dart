import 'package:gherkin/gherkin.dart';
import '../worlds/calculator_word.dart';

StepDefinitionGeneric thenTheResultShouldBe() {
  return then1<num, CalculatorWorld>(
    'the expected result should be {num}',
    (expected, context) async {
      context.expectMatch(context.world.calculator.getResult(), expected);
    },
  );
}

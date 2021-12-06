import 'package:gherkin/gherkin.dart';
import '../worlds/calculator_word.dart';

StepDefinitionGeneric givenTheNumbers() {
  return given2<num, num, CalculatorWorld>(
    'the numbers {num} and {num}',
    (input1, input2, context) async {
      context.world.calculator.push(input1);
      context.world.calculator.push(input2);
    },
  );
}

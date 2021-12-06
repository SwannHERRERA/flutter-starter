import 'package:gherkin/gherkin.dart';
import '../worlds/calculator_word.dart';

StepDefinitionGeneric whenTheyAreAdded() {
  return when<CalculatorWorld>(
    'they are added',
    (context) async {
      context.world.calculator.addAll();
    },
  );
}

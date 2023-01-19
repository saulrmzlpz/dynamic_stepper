# dynamic_stepper

Ability to dynamically create or remove steps in Material Stepper.

The solution was found in the following question: https://stackoverflow.com/a/52929474/6845731

Credits: https://github.com/sanket143


## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started


Just add the following import where it's needed:
```dart
import 'package:dynamic_stepper/dynamic_stepper.dart';
```

## Usage

Replace the original Stepper with DynamicStepper:

```dart
    final steps = [
        DynamicStep(
            title: const Text('Step 1 title'),
            content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 1'),
            ),
        ),
        const DynamicStep(
            title: Text('Step 2 title'),
            content: Text('Content for Step 2'),
        ),
        ];
    //...
    DynamicStepper(
        currentStep: _index,
        onStepCancel: () {
        // Handle candel
        },
        onStepContinue: () {
        // Handle continue
        },
        onStepTapped: (int index) {
        // Handle tapped
        },
        steps: steps,
    )
```
NOTE: The name of the properties has been replaced to avoid conflicts with the original Stepper, so the Dynamic prefix has been added.

DynamicStepper
DynamicStep
DynamicStepType ...

## Additional information

Visit repository if you have questions, issues or more info.

import 'package:dynamic_stepper/dynamic_stepper.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
const String _title = 'Flutter Code Sample';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _index = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Center(
        child: DynamicStepper(
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index < steps.length - 1) {
              setState(() {
                _index += 1;
              });
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: steps,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (steps.length == 1) return;
              steps.removeLast();
              if (_index == steps.length) _index--;
              setState(() {});
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              steps.add(DynamicStep(
                title: Text('Step ${steps.length + 1} title'),
                content: Text('Content for Step ${steps.length + 1}'),
              ));
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

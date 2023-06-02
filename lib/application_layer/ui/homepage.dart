import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../bloc/events.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _firstNumController = TextEditingController();
  final _secondNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _bloc = EventBloc();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 5.0),
                  ),
                  hintText: "Input 1",
                ),
                controller: _firstNumController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _secondNumController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 5.0),
                  ),
                  hintText: "Input 2",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center
              , children: [
                Text("Output :"),
                BlocBuilder(
                    bloc: _bloc,
                    builder: (context, state) {
                      return Text('$state');
                    }),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        final a = int.parse(_firstNumController.text);
                        final b = int.parse(_secondNumController.text);
                        _bloc.add(AddEvent(a, b));
                      },
                      child: const Text('Add')),
                  ElevatedButton(
                      onPressed: () {
                        final a = int.parse(_firstNumController.text);
                        final b = int.parse(_secondNumController.text);
                        _bloc.add(SubEvent(a, b));
                      },
                      child: const Text('Substract')),
                  ElevatedButton(
                      onPressed: () {
                        final a = int.parse(_firstNumController.text);
                        final b = int.parse(_secondNumController.text);
                        _bloc.add(mulEvent(a, b));
                      },
                      child: const Text('Multiply')),
                  ElevatedButton(
                      onPressed: () {
                        final a = int.parse(_firstNumController.text);
                        final b = int.parse(_secondNumController.text);
                        _bloc.add(divEvent(a, b));
                      },
                      child: const Text('Divide'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

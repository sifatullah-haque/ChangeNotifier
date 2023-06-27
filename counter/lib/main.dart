import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'change_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChangeProvider>(
      create: (context) => ChangeProvider(),
      child: const MaterialApp(
        title: 'Material App',
        home: homePageUi(),
      ),
    );
  }
}

class homePageUi extends StatelessWidget {
  const homePageUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("You've pressed the button this many times:"),
            const SizedBox(
              height: 20.0,
            ),
            Consumer<ChangeProvider>(
              builder: (_, value, __) => Text(
                "${value.counter}",
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<ChangeProvider>(context, listen: false).increaser(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

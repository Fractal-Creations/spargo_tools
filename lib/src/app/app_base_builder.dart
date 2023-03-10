import 'package:flutter/material.dart';

abstract class IAppBuilder {
  /// Метод сборки приложения
  Future<Widget> build();

  Widget getApp();

  /// Метод для инициализации приложения
  Future<void> init();
}

/// Базовый билдер приложения
class AppBaseBuilder implements IAppBuilder {
  /// Метод сборки приложения
  @override
  Future<Widget> build() async {
    await init();
    return Builder(builder: (context) {
      return getApp();
    });
  }

  @override
  Widget getApp() => const SpargoApp();

  /// Метод для инициализации приложения
  @override
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}

class SpargoApp extends StatelessWidget {
  const SpargoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spargo Flutter Community Demo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const SpargoDemoHomePage(title: 'Spargo Demo Home Page'),
    );
  }
}

class SpargoDemoHomePage extends StatefulWidget {
  const SpargoDemoHomePage({super.key, required this.title});

  final String title;

  @override
  State<SpargoDemoHomePage> createState() => _SpargoDemoHomePageState();
}

class _SpargoDemoHomePageState extends State<SpargoDemoHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo1/provider/countProvider.dart';
import 'package:flutter_demo1/viewmodel/MvvmDemoViewmodal.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo1/view/MvvmDemoView.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return CountProvider();
        }),
        ChangeNotifierProvider(create: ((context) {
          return MvvmDemoViewmodel();
        }))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider demo',
      routes: {
        "provider": (context) => const ProviderDemo(),
        "provider2": (context) => const ProviderDemoTwo(),
        "mvvmDemo": (context) => const MvvmDemoView(),
      },
      initialRoute: 'mvvmDemo',
      home: const ProviderDemo(),
    );
  }
}

class ProviderDemo extends StatefulWidget {
  const ProviderDemo({super.key});

  @override
  State<ProviderDemo> createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Provider demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(Provider.of<CountProvider>(context).count.toString()),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('provider2');
                },
                child: const Text('跳转')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<CountProvider>().addCount();
        },
      ),
    );
  }
}

class ProviderDemoTwo extends StatelessWidget {
  const ProviderDemoTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('provider two demo'),
      ),
      body: const Text('This is provider tow'),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          context.read<CountProvider>().addCount();
        },
      ),
    );
  }
}

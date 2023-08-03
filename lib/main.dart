import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Flutter code sample for [PageView].

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool data = await fetchData();

  if (!data) {
    MethodChannel closedChannel = const MethodChannel('tyger/closed');

    await closedChannel.invokeMethod('close');
  }

  runApp(const PageViewExampleApp());
}

Future fetchData() async {
  bool data = false;

  await Future.delayed(const Duration(seconds: 3), () {
    data = false;
  });

  return data;
}

class PageViewExampleApp extends StatelessWidget {
  const PageViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }
}

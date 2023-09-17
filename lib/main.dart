import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist_flutter/screens/login_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool data = await fetchData();

  if (!data) {
    MethodChannel closedChannel = const MethodChannel('tyger/closed');

    await closedChannel.invokeMethod('close');
  }

  runApp(const _App());
}

Future fetchData() async {
  bool data = false;

  await Future.delayed(const Duration(seconds: 3), () {
    data = true;
  });

  return data;
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

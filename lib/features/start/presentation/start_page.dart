import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rountiner/core/router/router.dart';

@RoutePage()
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StartPage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.router.push(MainRoute());
          },
          child: Text('Go to HomeScreen'),
        ),
      ),
    );
  }
}

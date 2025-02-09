import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rountiner/core/router/router.dart';

@RoutePage(name: 'MainRoute')
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainPage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).push(StartRoute());
          },
          child: Text('Go to StarScreen'),
        ),
      ),
    );
  }
}

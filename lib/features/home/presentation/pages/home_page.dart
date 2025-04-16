import 'package:flutter/material.dart';
import 'package:mint/features/home/presentation/widgets/home_button.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mint Software Solutions')),
      body: Center(
        child: HomeButton(
          title: 'Training',
          onPressed: () => context.router.pushPath('/training'),
        ),
      ),
    );
  }
}

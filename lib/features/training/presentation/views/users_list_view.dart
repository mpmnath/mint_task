import 'package:flutter/material.dart';
import 'package:mint/features/training/domain/entities/training.dart';
import 'package:mint/features/training/presentation/widgets/user_widget.dart';

class UsersListView extends StatelessWidget {
  final List<User> resources;

  const UsersListView({super.key, required this.resources});

  @override
  Widget build(BuildContext context) {
    if (resources.isEmpty) {
      return const Center(
        child: Text(
          'No users found',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: resources.length,
      itemBuilder: (context, index) {
        final user = resources[index];
        return UserWidget(user: user);
      },
    );
  }
}

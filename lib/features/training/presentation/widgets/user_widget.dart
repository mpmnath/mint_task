import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mint/core/extension/context_ext.dart';
import 'package:mint/features/training/domain/entities/training.dart';
import 'package:shimmer/shimmer.dart';

class UserWidget extends StatelessWidget {
  final User user;
  const UserWidget({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey[200],
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: user.photo,
            placeholder:
                (context, url) => Shimmer(
                  gradient: const LinearGradient(
                    colors: [Colors.grey, Colors.grey, Colors.grey],
                  ),
                  child: Container(width: 48, height: 48, color: Colors.white),
                ),
            errorWidget:
                (context, url, error) => Center(
                  child: Text(
                    user.firstName.isNotEmpty ? user.firstName[0] : '?',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
            fit: BoxFit.cover,
            width: 48,
            height: 48,
          ),
        ),
      ),
      title: Text(user.firstName, style: context.textTheme.bodyLarge),
      subtitle: Text(
        user.name,
        style: context.textTheme.bodyMedium!.copyWith(color: Colors.grey[600]),
      ),
    );
  }
}

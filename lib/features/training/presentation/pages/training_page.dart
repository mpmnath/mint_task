import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/core/extension/context_ext.dart';
import 'package:mint/features/training/presentation/blocs/training_cubit.dart';
import 'package:mint/features/training/presentation/blocs/training_state_ext.dart';

import 'package:mint/features/training/presentation/views/training_data_view.dart';

@RoutePage()
class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingCubit, TrainingState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading:
              () => const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
          loaded:
              (training) => Scaffold(
                appBar: AppBar(
                  title: Text(
                    training.categoryName,
                    style: context.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  leading: AutoLeadingButton(color: Colors.black),
                ),
                body: TrainingDataView(training: training),
              ),
          error:
              (message) => Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 16),
                      Text(message),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed:
                            () => context.read<TrainingCubit>().getTraining(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
          orElse:
              () => const Scaffold(
                body: Center(child: Text('Something went wrong')),
              ),
        );
      },
    );
  }
}

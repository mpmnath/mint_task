import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/core/extension/context_ext.dart';
import 'package:mint/core/routes/app_router.dart';
import 'package:mint/core/theme/theme.dart';
import 'package:mint/core/utils/values.dart';
import 'package:mint/features/training/presentation/blocs/training_cubit.dart';
import 'package:mint/injector.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          context.isTablet ? defaultTabletDesignSize : defaultDesignSize,
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => getIt<TrainingCubit>()..getTraining(),
        child: MaterialApp.router(
          theme: MintTheme.light,
          darkTheme: MintTheme.dark,
          themeMode: ThemeMode.system,

          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          routeInformationProvider: _appRouter.routeInfoProvider(),
        ),
      ),
    );
  }
}

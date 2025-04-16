import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/features/home/home.dart';
import 'package:mint/features/training/training.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: HomeRoute.page),
    AutoRoute(path: '/training', page: TrainingRoute.page),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
